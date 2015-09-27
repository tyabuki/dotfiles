# bash
if [ -f ~/.bashrc ]; then
    echo "exists '.bashrc'. rename it to '.bashrc.old'. "
    mv ~/.bashrc ~/.bashrc.old
fi
ln -siv ~/dotfiles/dot_bashrc ~/.bashrc


# zsh
if [ -f ~/.zshrc ]; then
    echo "exists '.zshrc'. rename it to '.zshrc.old'. "
    mv ~/.zshrc ~/.zshrc.old
fi
ln -siv ~/dotfiles/dot_zshrc ~/.zshrc


# tmux
if [ -f ~/.tmux.conf ]; then
    echo "exists '.tmux.conf'. rename it to '.tmux.conf.old'. "
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -siv ~/dotfiles/dot_tmux.conf ~/.tmux.conf


# emacs
if [ -f ~/.emacs ]; then
    echo "exists '.emacs'. rename it to '.emacs.old'."
    mv ~/.emacs ~/.emacs.old
fi
ln -siv ~/dotfiles/dot_emacs ~/.emacs

if [ -d ~/.emacs.d ]; then
    echo "exists '.emacs.d'. rename it to '.emacs.d.old'."
    mv ~/.emacs.d ~/.emacs.d.old
fi
ln -siv ~/dotfiles/dot_emacs.d ~/.emacs.d


# git
if [ -f ~/.gitconfig ]; then
    echo "exists '.gitconfig'. rename it to '.gitconfig.local'."
    mv ~/.gitconfig ~/.gitconfig.local
fi
ln -siv ~/dotfiles/dot_gitconfig ~/.gitconfig


