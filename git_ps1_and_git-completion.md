# git_ps1
## zshで使うために
1. `source ~/dotfiles/.zsh/.git-prompt.sh`とかやって読み込む
1. `setopt prompt_subst`とかやって，プロンプト内での変数展開を有効にする
1. `precmd()`で呼ぶ

```bash
precmd(){
    RPROMPT='$(__git_ps1 "[%s]")%~'
}
```

## オプション
`git-prompt.sh`のコメントに書いてあることを写しただけ．  
hoge=1というのは，空の値以外ならなんでも良い．
#### GIT_PS1_SHOWDIRTYSTATE=1
未ステージの変更（addしてない）があれば「*」 ステージ済の変更（addしてるがcommitしてない）があれば「+」
#### GIT_PS1_SHOWSTASHSTATE=1
スラッシュが存在すれば「$」
#### GIT_PS1_SHOWUNTRACKEDFILES=1
追跡されていない（一度もcommitされていない）ファイルがあれば「%」
#### GIT_PS1_SHOWUPSTREAM="verbose"
コミットの差分状態を表示．autoとverbose以外は使ったことないからよくわからん．

|変更が→|アップストリーム|ローカル|なし|
|:---:|:---:|:---:|:---:|
|auto（デフォルト）|<|>|=|
|verbose|u-数字|u+数字|=|
|name||||
|legacy||||
|git||||
|svn||||

#### GIT_PS1_DESCRIBE_STYLE="default"
よくわかっていない．

If you would like to see more information about the identity of commits checked out as a detached HEAD, set GIT_PS1_DESCRIBE_STYLE to one of these values:

|||
|---|---|
|contains|relative to newer annotated tag (v1.6.3.2~35)|
|branch|relative to newer tag or branch (master~4)|
|describe|relative to older annotated tag (v1.6.3.1-13-gdd42c2f)|
|default|exactly matching tag|

#### GIT_PS1_SHOWCOLORHINTS=0
GIT_PS1_SHOWDIRTYSTATEが有効な時，`git status -sb`的なカラーで表示．ただし`__git_ps1`を`PROMPT_COMMAND`か`precmd`で呼んでるときのみ．何故か動かん．

# git-completion
* `git-completion.zsh`は`git-comletion.bash`のラッパーなので，zshで使う場合でも両方必要
- 通常は同一ディレクトリに保存．そうでない場合は`.zshrc`に`zstyle ':completion:*:*:git:*' script ~/dotfiles/.zsh/.git-completion.bash`とか．
* `.zshrc`に`fpath=(~/dotfiles/.zsh $fpath)'とかでOK．ただし，`autoload -Uz compinit; compinit`よりも前に書くこと．
