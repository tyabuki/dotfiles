### originに関して
* ここ→[http://yabuuuuu.mydns.jp/yabuuuuu/dotfiles](http://yabuuuuu.mydns.jp/yabuuuuu/dotfiles)
 - **特に[wiki](http://yabuuuuu.mydns.jp/yabuuuuu/dotfiles/wikis/home)**

### 途中 or まだやってない
* emacs用設定書き直し中．
* `.screenrc` screenをほとんど使わないので放置．
* `.bashrc` ほとんど使わないが，とりあえずroot以外のプロンプトのみ設定．
* `install.sh`は結構適当．

### インストール
1. ホーム直下にclone（`~/dotfilesって感じ）
1. submoduleを引っ張ってくる．`git submodule init`とか`git submodule update`とか．[参考](http://git-scm.com/book/ja/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E3%82%B5%E3%83%96%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)
1. `install.sh`を叩くか，必要な場所へsym-linkを張る．
1. 環境依存設定（別ファイルへ隔離）は，ホームに存在（sym-link）すれば読み込まれる．

### zsh
* `.zshrc`はBSD系とLinux系どちらでも動くように書く．
 - 例えばMac固有の設定は`.zshrc.mac`に隔離する．使うときは`~/`にsym-linkを張れば読み込まれる．
 - そのほかの環境依存設定も，個別に`.zshrc.local`に書く．`~/`に置くかsym-linkを貼ると，同様に読み込まれる．

#### Git
* `.zshrc.g`に隔離する．git_ps1はgitリポジトリ内で自動で有効になる．
 - リポジトリのstatus表示はリポジトリにファイルが一杯あると重い．
 - **詳細は[wiki](http://yabuuuuu.mydns.jp/yabuuuuu/dotfiles/wikis/home)**

#### Docker
1. `.zshrc.docker`のsym-linkを張る．
1. 以下を`.zshrc.local`にでも書く

```Bash
if [ -f ~/.zshrc.docker ]; then
    source ~/.zshrc.docker
fi
```

### Emacs関連
* 今のところEmacs24専用．Emacs23では動かない．
 - カラーテーマの所をコメントアウトすれば23でも動くかも（未確認）
* sudoでは動かない．HOMEが変わるため？

### corp用設定について
* 個人用GitLab(yabuuuuu.mydns.jp)にはpushしない．
 - 個人用からマージして一方的に更新．従ってcorp専用設定以外はcorpリポジトリに加えない．

