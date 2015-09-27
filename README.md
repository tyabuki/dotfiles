# dotfiles
## 概要
本来prefixが`.`のファイルは，このリポジトリでは`dot_`で格納されている．
それぞれ適切な名前でホームディレクトリへコピーするか，sym-linkによって配置することによって利用できる．

## インストール
1. ホーム直下(`~/dotfiles`)にclone
1. submoduleを引っ張ってくる．`git submodule init`とか`git submodule update`とか．[参考](http://git-scm.com/book/ja/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E3%82%B5%E3%83%96%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)
1. `install.sh`を叩くか，必要な場所へsym-linkを張る．

* `install.sh`は以下を`~/dotfiles`へのsym-linkとして配置する．同名のファイルが既に存在する場合は，ファイル名にsuffixを付けてrenameする．
 - `.bashrc`
 - `.zshrc`
 - `.tmux.conf`
 - `.emacs`
 - `.emacs.d`
 - `.gitconfig`

## 中身
### bash
* promptとaliasのみ設定

### zsh
* localeは`en_US.UTF-8`
* 環境固有の設定は`zshrc.mac`や`.zshec.local`に記述して本体からinclude．

### tmux
* default shellはzsh
* prefix keyは`C-t`に変更．`C-b`はどう考えてもキャレットの左移動なので．
* 日本語が正しく表示されないときは`-u`オプションを付けてattachする（dockerコンテナ内のubuntu等）
* zsh同様に環境依存の設定は`.tmux.conf.local`などに記述して本体からinclude．zshの場所が異なるとか．

### emacs関連
* プラグインはpackage.elによる管理に移行した
 - `*.elc`も含めてリポジトリにぶち込んでいる
* emacs24より古いEmacsでも動くかどうかは不明
* sudoでは動かないときがある

### misc(miscellaneous)フォルダ
* dotfile以外の環境設定など
