# nilenso website

### Setting up

```bundle
bundle exec middleman```

### Deploying

Following this: https://www.digitalocean.com/community/tutorials/how-to-set-up-automatic-deployment-with-git-with-a-vps

```sh
make clean && make
make deploy
```

---

# nilenso blog

### Config

All your posts with `nilenso` in the tags should appear in Planet Nilenso. If they don't seem to be, make sure your RSS/ATOM feed is listed here:

https://github.com/nilenso/planet-nilenso/blob/master/planet.yml

### Automated execution

The crontab for the `deploy` user should execute the Planet script every 10 minutes. Log in as `deploy` and `crontab -l` to check.

### Manual execution

`sudo su deploy && crontab -l | tail -n1` should give you a command to run manually if you want to test the planet or your tagging. It will look something like:

```cd /home/www/planet.nilenso.com/current && bundle exec planet generate && rake generate```
