# nilenso website

### Setting up

```
brew install rbenv
brew install ruby-build
rbenv install 2.2.3
gem install bundler
bundler install
```

### Deploying

Following this: https://www.digitalocean.com/community/tutorials/how-to-set-up-automatic-deployment-with-git-with-a-vps ...yes, it's a bit of a pain in the ass, but it's not horrible and it's a zero-dependency solution which works for now.

```sh
make clean && make
git add .
git ci -m 'adding new partner: Leslie Lamport'
git pull
git push
make deploy
```

---

# nilenso blog

### Installing

Set up https://github.com/nilenso/planet-nilenso. Install `rbenv` and add this to `~/.bash_profile`:

```
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```

Then:

```
rbenv install 2.2.3
# start a new shell
gem install bundler
# start a new shell (i know, i know...)
bundle install
bundle exec planet generate
bundle exec rake generate

...this last command is currently failing with:

> jekyll 3.0.1 | Error:  undefined method `write' for class `Jekyll::Post'

...and we have no idea why. :(
```

Note: Since planet is currently broken (as of 17 Feb, 2016), the Gemfile of planet-nilenso uses forked repository (https://github.com/pote/planet.rb).

The pull request can be found at https://github.com/pote/planet.rb/pull/51 

Next, clone this repo (https://github.com/nilenso/nilenso.com) to the `deploy` user's home directory and run `make install-planet-sh` to set up the cron job.

### Config

All your posts with `nilenso` in the tags should appear in Planet Nilenso. If they don't seem to be, make sure your RSS/ATOM feed is listed here:

https://github.com/nilenso/planet-nilenso/blob/master/planet.yml

### Automated execution

The crontab for the `deploy` user should execute the Planet script every 10 minutes. Log in as `deploy` and `crontab -l` to check.

### Manual execution

`sudo su deploy && crontab -l | tail -n1` should give you a command to run manually if you want to test the planet or your tagging. It will look something like:

```cd /home/www/planet.nilenso.com/current && bundle exec planet generate && rake generate```
