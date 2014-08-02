# このscriptは'14,8,2現在．GitLab6.9.2から7.1.1へのアップデートに使用した

# 以下を参考
# https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/update.md

# Stop unicorn and sidekiq so we can do database migrations
sudo gitlab-ctl stop unicorn
sudo gitlab-ctl stop sidekiq

# Create a database backup in case the upgrade fails
sudo gitlab-rake gitlab:backup:create

# ubuntu14.04用の7.1.1の取得
wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.1.1-omnibus-1_amd64.deb

# Install the latest package
# 上記のパッケージ
sudo dpkg -i gitlab_7.1.1-omnibus-1_amd64.deb
# Ubuntu/Debian:
#sudo dpkg -i gitlab_x.x.x-omnibus.xxx.deb
# CentOS:
#sudo rpm -Uvh gitlab-x.x.x_xxx.rpm

# Reconfigure GitLab (includes database migrations)
sudo gitlab-ctl reconfigure

# Restart all gitlab services
sudo gitlab-ctl restart
