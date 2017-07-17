# nilenso website

### Setting up

```
brew install rbenv
brew install ruby-build
rbenv install 2.2.3
gem install bundler
bundle install
```

### Deploying

Following this: https://www.digitalocean.com/community/tutorials/how-to-set-up-automatic-deployment-with-git-with-a-vps ...yes, it's a bit of a pain in the ass, but it's not horrible and it's a zero-dependency solution which works for now.

```sh
make clean && make
git add .
git ci -m 'adding new partner: Leslie Lamport'
git pull
git push
```

There is a cron job set up on the website machine which runs everything 15 minutes and pulls the latest code from github. The changes will be up on the website within 15 minutes.

The crontab line for reference:

```crontab
*/15 * *   *   *     cd /home/deploy/nilenso.com && git pull
```

### Renewing SSL Certificate

Log into the machine and run the following:

```sh
sudo certbot renew
sudo service nginx reload
```

The production box should have a crontab setup for renewal under the `root` user crontab `sudo crontab -l`

```
0 */12 * * * certbot renew --post-hook "service nginx reload"
```

If this crontab does not exist, you can add it back by `sudo crontab -e`. It's recommended to run the renewal twice a day.

---

# nilenso blog

### Installing

Clone this repo (https://github.com/nilenso/nilenso.com) to the `deploy` user's home directory and run `make install-planet-sh` to set up the cron job. Set up https://github.com/nilenso/blog.nilenso.com using the instructions provided.


### Config

All your posts with `nilenso` in the tags should appear in Planet Nilenso. If they don't seem to be, make sure your RSS/ATOM feed is listed here:

https://github.com/nilenso/blog.nilenso.com/blob/master/planet.yml


### Automated execution

The crontab for the `deploy` user should execute the Planet script every 10 minutes. Log in as `deploy` and `crontab -l` to check.


### Manual execution

`sudo su deploy && crontab -l | tail -n1` should give you a command to run manually if you want to test the planet or your tagging.
