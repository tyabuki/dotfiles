## bash
if [ -f ~/.bash_profile ]; then
    echo "exists '.bash_profile'. rename it to '.bash_profile.old'. "
    mv ~/.bash_profile ~/.bash_profile.old
fi
ln -siv ~/dotfiles/.bash_profile.mac ~/.bash_profile

if [ -f ~/.bashrc ]; then
    echo "exists '.bashrc'. rename it to '.bashrc.old'. "
    mv ~/.bashrc ~/.bashrc.old
fi
ln -siv ~/dotfiles/.bashrc.mac ~/.bashrc


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

if [ -f ~/.tmux.conf.mac ]; then
    echo "exists '.tmux.conf.mac'. rename it to '.tmux.conf.mac.old'. "
    mv ~/.tmux.conf.mac ~/.tmux.conf.mac.old
fi
ln -siv ~/dotfiles/.tmux.conf.mac ~/.tmux.conf.mac

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




