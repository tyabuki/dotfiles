
sudo yum install -y gnupg
gpg --list-keys
sed -e "s/#keyserver-options auto-key-retrieve/keyserver-options auto-key-retrieve/g" ~/.gnupg/gpg.conf > ~/.gnupg/gpg.conf2
cp ~/.gnupg/gpg.conf ~/.gnupg/gpg.conf.old
mv ~/.gnupg/gpg.conf2 ~/.gnupg/gpg.conf

