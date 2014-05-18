### 途中 or まだやってない
* emacs用設定書き直し中．23/24対応．
- Terminal版とCocoa版とX-Window版で微妙に動いたり動かなかったりする．
* `.screenrc` screenをほとんど使わないので放置．
* `.bashrc` ほとんど使わないが，とりあえずroot以外のプロンプトのみ設定．
* `install.sh`は結構適当．

### インストール
1. ホーム直下にclone（`~/dotfilesって感じ）
1. Solarized関係のsubmoduleを引っ張ってくる．`git submodule init`とか`git submodule update`とか．[参考](http://git-scm.com/book/ja/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E3%82%B5%E3%83%96%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)
1. `install.sh`を叩くか，必要な場所へsym-linkを張る．
1. 環境依存設定（別ファイルへ隔離）は，ホームに存在（sym-link）すれば読み込まれる．

### zshについて
`.zshrc`はBSD系とLinux系になんとなく対応．

一部Mac固有の設定は`.zshrc.mac`に隔離．ホームにsym-linkを張れば読み込まれる．

環境依存設定は，個別に`.zshrc.local`に書く．ファイルがあれば，最後に読み込まれる．

### Git関連の設定について
`.zshrc.g`に隔離．当然gitが無いと動かない．

status表示はリポジトリにファイルが一杯あると重い．

**promptにbranchやrepositoryの状態を表示や，branch名の補完関連は，wikiか[git_ps1_and_git-completion.md](git_ps1_and_git-completion.md)あたりを参照．**

### Solarized color theme
* MacOSX + iTerm2では概ねOK．
- iTerm用のカラーテーマはカスタム（Bright colorに対応する等一部調整）した．
- EmacsはTerminal上では多少色がおかしいがまぁOK．
- Cocoa版では，色は正しいがコメント（斜体）が豆腐になる．[参考](http://gongo.hatenablog.com/entry/2011/12/08/232953)
* Ubuntu + Gnome Terminalでは色がほとんど適用されないが，普通に動くっぽいのでOK
- X-WindowのEmacsには何故か全く適用されない（調査中）
* 各プロジェクト
- [Solarized](https://github.com/altercation/solarized)
- [solarized-emacs](https://github.com/bbatsov/solarized-emacs) （未使用）
- [emacs-color-theme-solarized](https://github.com/sellout/emacs-color-theme-solarized)

### corp用設定について
* 個人用GitLab(yabuuuuu.mydns.jp)にはpushしない．
- 個人用からマージして一方的に更新．従ってcorp専用設定以外はcorpリポジトリに加えない．