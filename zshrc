DOT_PATH="${HOME}/dotfiles"
LANG=en_US.UTF-8
ulimit -u unlimited

bindkey -e # emacs bind
setopt correct # スペルミスの訂正を行う
setopt list_packed # compact viewを有効
setopt no_beep # beepを鳴らさない
setopt nolistbeep # beepを鳴らさない
setopt notify # background jobの状態報告を即座に行う
setopt rm_star_wait # 特定の対象へのrm実行前に10秒待ち，その後確認する


##### history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist # cshスタイルの履歴展開を有効（!cなど）
setopt hist_ignore_dups # 直前のイベントと全く同じものは記憶しない
setopt hist_ignore_all_dups # 既存のものと全く同じ場合，古い方を削除する
setopt hist_ignore_space # 先頭がスペースのコマンドは記憶しない
setopt hist_no_functions # 関数定義は記憶しない
setopt hist_no_store # historyコマンドは記憶しない
setopt hist_reduce_blanks # 余分なスペースを取り除く
setopt inc_append_history # 履歴をインクリメンタルに追加
setopt share_history # historyを異なるzsh間で共有


##### load
autoload -Uz compinit
compinit
PLUGIN_PATH="${DOT_PATH}/zsh-plugins"
fpath=("${PLUGIN_PATH}/zsh-completions/src" $fpath)
source "${PLUGIN_PATH}/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${PLUGIN_PATH}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "${PLUGIN_PATH}/history-search-multi-word/history-search-multi-word.plugin.zsh"
source "${PLUGIN_PATH}/alias-tips/alias-tips.plugin.zsh"
# source "${PLUGIN_PATH}/zsh-abbr/zsh-abbr.zsh"
source "${PLUGIN_PATH}/zsh-abbrev-alias/abbrev-alias.plugin.zsh"
source "${PLUGIN_PATH}/spaceship-prompt/spaceship.zsh"
if type fzf > /dev/null 2>&1; then
  source "${PLUGIN_PATH}/enhancd/init.sh"
  ENHANCD_HOOK_AFTER_CD=ls
  abbrev-alias fbr='select-git-switch'
  abbrev-alias fadd='fzf_preview_git_add'
  if type ghq > /dev/null 2>&1; then
    abbrev-alias fghq='ghq_list_fzf'
    abbrev-alias fghqr='ghq_preview_readme'
    abbrev-alias fghqf='ghq_preview_file_list'
    abbrev-alias fghqh='ghq_preview_history'
  fi
fi

### prompt
# https://github.com/denysdovhan/spaceship-prompt/blob/master/spaceship.zsh#L41
  SPACESHIP_PROMPT_ORDER=(
    time           # Time stamps section
    user           # Username section
    dir            # Current directory section
    host           # Hostname section
    git            # Git section (git_branch + git_status)
#     hg             # Mercurial section (hg_branch  + hg_status)
    package        # Package version
    node           # Node.js section
#     bun            # Bun section
#     deno           # Deno section
    ruby           # Ruby section
    python         # Python section
#     elm            # Elm section
#     elixir         # Elixir section
    xcode          # Xcode section
    swift          # Swift section
    golang         # Go section
    perl           # Perl section
    php            # PHP section
    rust           # Rust section
    haskell        # Haskell Stack section
    scala          # Scala section
    kotlin         # Kotlin section
    java           # Java section
    lua            # Lua section
    dart           # Dart section
#     julia          # Julia section
#     crystal        # Crystal section
    docker         # Docker section
    docker_compose # Docker section
    aws            # Amazon Web Services section
    gcloud         # Google Cloud Platform section
    azure          # Azure section
    venv           # virtualenv section
#     conda          # conda virtualenv section
#     dotnet         # .NET section
#     ocaml          # OCaml section
#     vlang          # V section
#     zig            # Zig section
#     purescript     # PureScript section
#     erlang         # Erlang section
    kubectl        # Kubectl context section
    ansible        # Ansible section
#     terraform      # Terraform workspace section
#     pulumi         # Pulumi stack section
#     ibmcloud       # IBM Cloud section
#     nix_shell      # Nix shell
    gnu_screen     # GNU Screen section
    exec_time      # Execution time
    async          # Async jobs indicator
    line_sep       # Line break
    battery        # Battery level and status
    jobs           # Background jobs indicator
    exit_code      # Exit code section
    sudo           # Sudo indicator
    char           # Prompt character
  )
SPACESHIP_TIME_SHOW=true
# SPACESHIP_USER_SHOW=always
SPACESHIP_DIR_TRUNC=5
SPACESHIP_DIR_LOCK_SYMBOL=🔐
# SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_SHOW_FULL=true
SPACESHIP_GIT_BRANCH_PREFIX=🐙
SPACESHIP_BATTERY_THRESHOLD=75
SPACESHIP_EXIT_CODE_SHOW=true


##### functions
# historyから除外するコマンド(ls,cd,rm,manなど)
zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}
    [[ ${cmd} != (l|l[sal]) && ${cmd} != (c|cd) && ${cmd} != (r[mr]) && ${cmd} != (m|man) ]]
}

function cd-gitroot() {
    cd ./$(git rev-parse --show-cdup)
    if [ $# = 1 ]; then
        cd $1
    fi
}

# ghq + fzf: list
function ghq_list_fzf() {
  local dir
  dir=$(ghq list > /dev/null | fzf-tmux --reverse +m) && cd $(ghq root)/$dir
}

# ghq + fzf: readme
function ghq_preview_readme() {
  local dir
  dir=$(ghq list > /dev/null | fzf --preview "cat $(ghq root)/{}/README.*") && cd $(ghq root)/$dir
}

# ghq + fzf: file list
function ghq_preview_file_list() {
  local dir
  dir=$(ghq list > /dev/null | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'") && cd $(ghq root)/$dir
}

# ghq + fzf: history
function ghq_preview_history() {
  local dir
  dir=$(ghq list > /dev/null | fzf --preview "git --git-dir $(ghq root)/{}/.git lg --color=always") && cd $(ghq root)/$dir
}

# fzf で git log を見ながらブランチ移動する - https://zenn.dev/yamo/articles/5c90852c9c64ab
function fzf_preview_git_checkout() {
  git branch -a | fzf --preview-window="right,75%" --preview="echo {} | tr -d ' *' | xargs git lg --color=always" | xargs git checkout
}

function fzf_preview_git_add() {
    local selected
    selected=$(git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if [[ -n "$selected" ]]; then
        selected=$(tr '\n' ' ' <<< "$selected")
        echo -n $selected | xargs git add
        echo "Completed: git add $selected"
    fi
}

##### zsh-abbrev-alias
abbrev-alias cdg='cd-gitroot'
abbrev-alias L='less +F'
abbrev-alias -g -e B='$(git symbolic-ref --short HEAD 2> /dev/null)'
# abbrev-alias drm='docker rm $(docker ps -f "status=exited" -q)'
abbrev-alias drm='docker container prune' # 1.13+
# abbrev-alias drmi='docker rmi $(docker images -f "dangling=true" -q)'
abbrev-alias drmi='docker image prune' # 1.13+
abbrev-alias

case "${OSTYPE}" in
darwin*|freebsd*)
  alias ls="ls -G"
  ;;
linux*)
  alias ls="ls --color=auto"
  ;;
esac
alias ll="ls -lh"
alias la="ls -lah"

### include
if [ -f ~/.zshrc_mac ]; then
  source ~/.zshrc_mac
fi

if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
