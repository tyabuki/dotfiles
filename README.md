### まだやってない
* emacs用設定書き直し中．23/24対応．
* `.screenrc` screenをもう使わないので放置．
* `.bashrc` ほとんど使わないが，とりあえずroot以外のプロンプトのみ設定．
* `install.sh`は結構適当．

### インストール
1. ホーム直下にclone（`~/dotfilesって感じ）
2. `install.sh`を叩くか，必要な場所へsym-linkを張る．
3. 環境依存設定（別ファイルへ隔離）は，ホームに存在（sym-link）すれば読み込まれる．

### zshについて
`.zshrc`はBSD系とLinux系になんとなく対応．

一部Mac固有の設定は`.zshrc.mac`に隔離．ホームにsym-linkを張れば読み込まれる．

環境依存設定は，個別に`.zshrc.local`に書く．ファイルがあれば，最後に読み込まれる．

### Git関連の設定について
`.zshrc.g`に隔離．当然gitが無いと動かない．

status表示はリポジトリにファイルが一杯あると重い．

**promptにbranchやrepositoryの状態を表示や，branch名の補完関連は，該当wiki（[git_ps1](git_ps1)，[git completion](git-completion)）をそれぞれ参照．**

### corp用設定について
個人用GitLab(yabuuuuu.mydns.jp)にはpushしない．

更新は個人用から頑張ってマージする．corp専用設定以外はcorpリポジトリに加えない（単方向のため）