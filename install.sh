
## zsh
if [ -f ~/.zshrc ]; then
    echo "exists '.zshrc'. rename it to '.zshrc.old'. "
    mv ~/.zshrc ~/.zshrc.old
fi
ln -siv ~/dotfiles/.zshrc ~/.zshrc

#if [ -f ~/.zshrc.git ]; then
#    echo "exists '.zshrc.git'. rename it to '.zshrc.git.old'. "
#    mv ~/.zshrc.git ~/.zshrc.git.old
#fi
#ln -siv ~/dotfiles/.zshrc.git ~/.zshrc.git

## tmux
if [ -f ~/.tmux.conf ]; then
    echo "exists '.tmux.conf'. rename it to '.tmux.conf.old'. "
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -siv ~/dotfiles/.tmux.conf ~/.tmux.conf

## emacs
if [ -f ~/.emacs ]; then
    echo "exists '.emacs'. rename it to '.emacs.old'."
    mv ~/.emacs ~/.emacs.old
fi
ln -siv ~/dotfiles/.emacs ~/.emacs

if [ -d ~/.emacs.d ]; then
    echo "exists '.emacs.d'. rename it to '.emacs.d.old'."
    mv ~/.emacs.d ~/.emacs.d.old
fi
ln -siv ~/dotfiles/.emacs.d ~/.emacs.d


