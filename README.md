忘れないようにメモ．

### origin
* [http:/gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles](http://gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles)
 - **[wiki](http://gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles/wikis/home)**

### 途中・まだやってない
* emacs関連は24対応のため全て破棄して書き直し中
 - package.elによる管理に移行
* `.screenrc` もうscreenをほとんど使わないので放置．tmuxに移行．
* `.bashrc` ほとんど使わないので適当．．
* `.tmux.conf.*` 大体fix
* `.zshrc*` 適宜追加していくが，冗長な設定が増えてきているので整理したい．
* `install.sh` 結構適当．必要なら手でsym-linkを張る．
* vimの設定ファイルは無い．なぜなら`alias vim="emacs"`で対応可能なため．

### インストール
1. ホーム直下にclone（`~/dotfiles`って感じ）
1. submoduleを引っ張ってくる．`git submodule init`とか`git submodule update`とか．[参考](http://git-scm.com/book/ja/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E3%82%B5%E3%83%96%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)
1. `install.sh`を叩くか，必要な場所へsym-linkを張る．

* `install.sh`は今のところ以下のファイルのsym-linkを張る．同名のファイルが既に存在すれば，ファイル名の末尾に`.old`を付けてリネームする．
 - `.zshrc`
 - `.tmux.conf`
 - `.emacs`
 - `.emacs.d`

### zsh
* localeは`en_US.UTF-8`
* `.zshrc`本体はBSD系とLinux系どちらでも動くように書く．
 - 例えばMac固有の設定は`.zshrc.mac`に書く．使うときは`~/`にsym-linkを張れば読み込まれる．
 - そのほかの環境依存設定（gitが無いとだめとか）も，個別にファイルを作って書く．`.zshrc.local`は`~/`に存在すれば読み込まれるので利用する．

### Tmux
* default shellはzsh
* prefix keyは`C-t`に変更．`C-b`はどう考えてもキャレットの左移動なので．
* 日本語が正しく表示されないときは`-u`オプションを付けてattachする（dockerコンテナ内のubuntu等）
* zsh同様に環境依存の設定は`.tmux.conf.local`などに書くようにした
 - OSXやBSDはzshの位置が異なるので，それに対応した`.tmux.conf.max` `.tmux.conf.bsd`を用意した

### Git
* `.zshrc.git`のsym-linkを張る．git_ps1はgitリポジトリ内で自動で有効になる．
 - **詳細は[wiki](http://gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles/wikis/home)**

### Docker
1. `.zshrc.docker`のsym-linkを張る．
1. 以下を`.zshrc.local`にでも書く

* dockerをsudo無しで使うには，dockerが使うUNIXソケット`/var/run/docker.sock`に書き込み権限が必要．dockerグループにでも突っ込んでおく．


```Bash
if [ -f ~/.zshrc.docker ]; then
    source ~/.zshrc.docker
fi
```

### Emacs関連
* プラグインはpackage.elによる管理に移行した
 - `*.elc`も含めてリポジトリにぶち込んでいる
* Emacs24より古いEmacsでも動くかは不明
* sudoでは動かないときがある

### misc(miscellaneous)フォルダ
* dotfile以外の環境設定など


