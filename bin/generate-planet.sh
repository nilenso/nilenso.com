#!/usr/bin/env sh

LOGFILE=/home/deploy/log/planet.log

# needed for rbenv
. /home/deploy/.bashrc

echo >> $LOGFILE
date >> $LOGFILE

cd /home/www/planet.nilenso.com/current \
  && bundle exec planet generate >> $LOGFILE 2>&1 \
  && bundle exec rake generate >> $LOGFILE 2>&1

echo "Logged to $LOGFILE"
