
## zsh
ln -siv ~/dotfiles/.zshrc ~/.zshrc

## bash
#ln -siv ~/dotfiles/.bash_profile ~/.bash_profile
#ln -siv ~/dotfiles/.bashrc ~/.bashrc

## tmux
ln -siv ~/dotfiles/.tmux.conf ~/.tmux.conf

## emacs
if [ -f ~/.emacs ]; then
    echo "exists .emacs  rename .emacs.old"
    mv ~/.emacs ~/.emacs.old
fi
ln -siv ~/dotfiles/.emacs ~/.emacs

if [ -d ~/.emacs.d ]; then
    echo "exists .emacs.d  rename .emacs.d.old"
    mv ~/.emacs.d ~/.emacs.d.old
fi
ln -siv ~/dotfiles/.emacs.d ~/.emacs.d

## screen
#ln -siv ~/dotfiles/.screenrc ~/.screenrc


