# nilenso website

---

### Setting up
  `bundle`

  `bundle exec middleman`

Live-reload is enabled.

### Deploying

Following this: https://www.digitalocean.com/community/tutorials/how-to-set-up-automatic-deployment-with-git-with-a-vps

We used:

```sh
#!/bin/sh
git --work-tree=/home/www/nilenso.com --git-dir=/home/wwww/repos/nilenso.com.git checkout -f
```

You'll need:

`git remote add production ssh://www@nilenso.com/home/wwww/repos/nilenso.com.git`

`git push production master`
