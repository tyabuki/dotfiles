# 環境固有の設定は，.zsh.localとか.zsh.macに書く．

### 基本設定
autoload -U colors; colors # カラー表示を有効
export LANG=ja_JP.UTF-8
ulimit -u unlimited # 1ユーザあたりのプロセス数上限

### key bind(Emacs)
export EDITOR=emacs
export SVN_EDITOR=emacs
bindkey -e

### プロンプトの指定
case ${UID} in
# root
0)
    PROMPT="%B[%F{1}%n@%M%f]%#%b "
    RPROMPT="%~"
    ;;
# 一般ユーザ
*)
    PROMPT="%B[%F{2}%n@%M%f]%#%b "
    RPROMPT="%~"
    ;;
esac 

### 補完関連
# git用補完とRPROMPT
if [ -f ~/.zshrc.g ]; then
    source ~/.zshrc.g
fi
autoload -Uz compinit; compinit # 補完有効
#autoload -Uz predict-on; predict-on # 先行補完を有効
setopt correct # スペルミスの訂正を行う
setopt list_packed # compact viewを有効
setopt no_beep # beepを鳴らさない
setopt nolistbeep # beepを鳴らさない

### history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt bang_hist # cshスタイルの履歴展開を有効（!cなど）
setopt hist_ignore_dups # 直前のイベントと全く同じものは記憶しない
setopt hist_ignore_all_dups # 既存のものと全く同じ場合，古い方を削除する
setopt hist_ignore_space # 先頭がスペースのコマンドは記憶しない
setopt hist_no_functions # 関数定義は記憶しない
setopt hist_no_store # historyコマンドは記憶しない
setopt hist_reduce_blanks # 余分なスペースを取り除く
setopt share_history # historyを異なるzsh間で共有
zshaddhistory(){ # その他除外するコマンドの指定(ls,cd,rm,man系)
    local line=${1%%$'\n'}
    local cmd=${line%% *}
    [[ ${cmd} != (l|l[sal])
	    && ${cmd} != (c|cd)
	    && ${cmd} != (r[mr])
	    && ${cmd} != (m|man)
    ]]
}

### lsのエイリアス（linuxとBSD系でオプションが違う）
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -l"
  alias la="ls -la"
  ;;
linux*)
  alias ls="ls --color=auto"
  alias ll="ls -l"
  alias la="ls -la"
  ;;
esac

### cd / auto pushd関連
#setopt auto_cd # ディレクトリ名で勝手にcd
setopt auto_pushd # 自動でpushd(cd -[tab])
DIRSTACKSIZE=100
setopt pushd_ignore_dups # 同一ディレクトリは古い方を削除する
setopt pushd_to_home # 引数を省略した場合は$HOMEへ移動
# cdのあとにlsを自動で実行
function cd(){
    builtin cd $@
    ls
}

### mkdirのあとにcdを自動で実行
function mkdir(){
    if [ ! -n "$1" ]; then
	echo "Enter a directory name."
    elif [ -d $1 ]; then
	echo "'$1' already exists! cd into the directory."
	builtin cd $1
    else
	command mkdir -p $1
	builtin cd $1
    fi
}

### その他設定
setopt notify # background jobの状態報告を即座に行う
setopt rm_star_wait # 特定の対象へのrm実行前に10秒待ち，その後確認する

### ターミナルのタイトルに実行中のコマンド名を出力
# よく分からないのでそのうち直す
case "${TERM}" in
kterm*|*xterm*|(dt|k|E)term)
    precmd(){
	# a function which is executed just before each prompt
	echo -ne "\033]0;${USER}@${HOST%%.*} : ${PWD}\007"
    }
    preexec(){
	# a function which is just before a command is excuted
	print -Pn "\e]0;${USER}@${HOST%%.*} : ${PWD} : $1\a"
	#print -Pn "\e]0;$*\a"
    }
    ;;
esac 

### 環境依存設定の読み込み
# ローカル設定
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
# mac用
if [ -f ~/.zshrc.mac ]; then
    source ~/.zshrc.mac
fi

#################################################
# プロンプト表示フォーマットのメモ
# http://zsh.sourceforge.net/Doc/Release/zsh_12.html#SEC40
#################################################
# %% %を表示
# %) )を表示
# %l 端末名省略形
# %M ホスト名(FQDN)
# %m ホスト名(サブドメイン)
# %n ユーザー名
# %y 端末名
# %# rootなら#、他は%を表示
# %? 直前に実行したコマンドの結果コード
# %d ワーキングディレクトリ %/ でも可
# %~ ホームディレクトリからのパス
# %h ヒストリ番号 %! でも可
# %a The observed action, i.e. "logged on" or "logged off".
# %S (%s) 反転モードの開始/終了 %S abc %s とするとabcが反転
# %U (%u) 下線モードの開始/終了 %U abc %u とするとabcに下線
# %B (%b) 強調モードの開始/終了 %B abc %b とするとabcを強調
# %t 時刻表示(12時間単位、午前/午後つき) %@ でも可
# %T 時刻表示(24時間表示)
# %* 時刻表示(24時間表示秒付き)
# %w 日表示(dd) 日本語だと 曜日 日
# %W 年月日表示(mm/dd/yy)
# %D 年月日表示(yy-mm-dd)
# %F 文字の色(%fで終了) *1
# %K 文字背景の色(%kで終了) *1
# 
# *1:色は基本だけなら、0:black、1:red、2:green、3:yellow、4:blue、5:magenta、6:cyan、7:whiteが利用できる。数字は色の番号。 

