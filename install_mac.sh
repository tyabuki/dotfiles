# bash
if [ -f ~/.bash_profile ]; then
    echo "exists '.bash_profile'. rename it to '.bash_profile.old'. "
    mv ~/.bash_profile ~/.bash_profile.old
fi
ln -siv ~/dotfiles/dot_bash_profile_mac ~/.bash_profile

if [ -f ~/.bashrc ]; then
    echo "exists '.bashrc'. rename it to '.bashrc.old'. "
    mv ~/.bashrc ~/.bashrc.old
fi
ln -siv ~/dotfiles/dot_bashrc_mac ~/.bashrc


# zsh
if [ -f ~/.zshrc ]; then
    echo "exists '.zshrc'. rename it to '.zshrc.old'. "
    mv ~/.zshrc ~/.zshrc.old
fi
ln -siv ~/dotfiles/dot_zshrc ~/.zshrc

if [ -f ~/.zshrc_mac ]; then
    echo "exists '.zshrc_mac'. rename it to '.zshrc_mac.old'. "
    mv ~/.zshrc_mac ~/.zshrc_mac.old
fi
ln -siv ~/dotfiles/dot_zshrc_mac ~/.zshrc_mac


# tmux
if [ -f ~/.tmux.conf ]; then
    echo "exists '.tmux.conf'. rename it to '.tmux.conf.old'. "
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -siv ~/dotfiles/dot_tmux.conf ~/.tmux.conf

if [ -f ~/.tmux_mac.conf ]; then
    echo "exists '.tmux_mac.conf'. rename it to '.tmux_mac.conf.old'. "
    mv ~/.tmux_mac.conf ~/.tmux_mac.conf.old
fi
ln -siv ~/dotfiles/dot_tmux_mac.conf ~/.tmux_mac.conf


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
    echo "exists '.gitconfig'. rename it to '.gitconfig_local'."
    mv ~/.gitconfig ~/.gitconfig_local
fi
ln -siv ~/dotfiles/dot_gitconfig ~/.gitconfig





