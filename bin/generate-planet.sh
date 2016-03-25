#!/usr/bin/env sh

LOGFILE=/home/deploy/log/planet.log

# needed for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo >> $LOGFILE
date >> $LOGFILE

cd /home/deploy/blog.nilenso.com \
  && bundle exec planet generate >> $LOGFILE 2>&1 \
  && bundle exec jekyll build >> $LOGFILE 2>&1

echo "Logged to $LOGFILE"
