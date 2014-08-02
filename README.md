忘れないようにメモ．

### origin
* [http:/gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles](http://gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles)
 - **[wiki](http://gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles/wikis/home)**

### 途中 or まだやってない
* emacs用設定は24対応のため全て破棄して書き直し中．
* `.screenrc` もうscreenをほとんど使わないので放置．tmuxに移行．
* `.bashrc` ほとんど使わないが，とりあえずroot以外のプロンプトのみ設定．
* `.zshrc*`は適宜追加していくが，冗長な設定が増えてきているので整理したい．
* `install.sh`は結構適当．

### インストール
1. ホーム直下にclone（`~/dotfiles`って感じ）
1. submoduleを引っ張ってくる．`git submodule init`とか`git submodule update`とか．[参考](http://git-scm.com/book/ja/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E3%82%B5%E3%83%96%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)
1. `install.sh`を叩くか，必要な場所へsym-linkを張る．

* `install.sh`は今のところ以下のファイルのsym-linkを張る．同名のファイルが既に存在すれば，ファイル名の末尾に`.old`を付けてリネームする．
 - `.zshrc`
 - `.tmux.conf`
 - `.emacs.d`

### zsh
* `.zshrc`本体はBSD系とLinux系どちらでも動くように書く．
 - 例えばMac固有の設定は`.zshrc.mac`に書く．使うときは`~/`にsym-linkを張れば読み込まれる．
 - そのほかの環境依存設定（gitが無いとだめとか）も，個別にファイルを作って書く．`.zshrc.local`は`~/`に存在すれば読み込まれるので利用する．

### Tmux
* zshがあること前提
* zsh同様に環境依存の設定は`.tmux.conf.local`などに書くようにした
 - OSXやBSDはzshの位置が異なるので，それに対応した`.tmux.conf.max` `.tmux.conf.bsd`を用意した

#### Git
* `.zshrc.git`のsym-linkを張る．git_ps1はgitリポジトリ内で自動で有効になる．
 - **詳細は[wiki](http://gitlab.yabuuuuu.mydns.jp/yabuuuuu/dotfiles/wikis/home)**

#### Docker
1. `.zshrc.docker`のsym-linkを張る．
1. 以下を`.zshrc.local`にでも書く

* dockerをsudo無しで使うには，dockerが使うUNIXソケット`/var/run/docker.sock`に書き込み権限が必要．dockerグループにでも突っ込んでおく．


```Bash
if [ -f ~/.zshrc.docker ]; then
    source ~/.zshrc.docker
fi
```

### Emacs関連
* 今のところEmacs24専用．Emacs23では動かない．
 - カラーテーマの所をコメントアウトすれば23でも動くかも（未確認）
 - sudoでは動かないときは，後から入れたEmacs24がちゃんと起動しているか確認．

### misc(miscellaneous)フォルダ
* dotfile以外の環境設定など

### 会社では
* 個人用GitLab(gitlab.yabuuuuu.mydns.jp)からpullするのは良いが，pushしてはいけない

