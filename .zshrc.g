### git用の設定
# 使うか使わないかは，ホームディレクトリにsym-linkを張るかどうか

### 右プロンプトにgitのstatusとカレントディレクトリを表示
source ~/dotfiles/.zsh/.git-prompt.sh
setopt prompt_subst # プロンプト内で変数を展開
GIT_PS1_SHOWDIRTYSTATE=1 # 未ステージの変更があれば「*」 ステージ済の変更があれば「+」
GIT_PS1_SHOWSTASHSTATE=1 # スラッシュが存在すれば「$」
GIT_PS1_SHOWUNTRACKEDFILES=1 # 追跡されていないファイルがあれば「%」
GIT_PS1_SHOWUPSTREAM="verbose" # コミットの差分状態を表示(下記)
#            アップストリーム|ローカル|変更なし
#   auto    |      <         |    >   |   =
#   verbose |    u-数字      | u+数字 |   =
#GIT_PS1_DESCRIBE_STYLE="default"
GIT_PS1_SHOWCOLORHINTS=0 # DIRTYSTATEhが有効な時，カラー表示
precmd(){
    RPROMPT='$(__git_ps1 "[%s]")%~'
}

### git用の補完設定
zstyle ':completion:*:*:git:*' script ~/dotfiles/.zsh/.git-completion.sh
fpath=(~/dotfiles/.zsh $fpath)
