.PHONY:	help ? tests

build:
	bundle exec middleman build

serve:
	bundle exec middleman

clean:
	rm -rf build

deploy:
	git push production master

install-planet-sh: /home/deploy/bin/generate-planet.sh
	@echo "Add the following line to the 'deploy' user with 'crontab -e':"
	@echo "*/10 * * * * /home/deploy/bin/generate-planet.sh"

/home/deploy/bin/generate-planet.sh: /home/deploy/bin /home/deploy/log
	cp bin/generate-planet.sh $@
	chmod +x $@

/home/deploy/bin:
	mkdir $@

/home/deploy/log:
	mkdir $@

add-remote:
	git remote add production ssh://www@nilenso.com/home/www/repos/nilenso.com.git

print-server-hook:
	@echo \#!/bin/sh
	@echo git --work-tree=/home/www/nilenso.com --git-dir=/home/www/repos/nilenso.com.git checkout -f

help: ?

?:
	@echo
	@echo "add-remote .......... Add the production server as a git remote"
	@echo "print-server-hook ... Print the hook to add the production server"
	@echo "clean ............... Clean before building"
	@echo "serve ............... Serve up nilenso.com locally"
	@echo "build ............... Build nilenso.com static site"
	@echo "deploy .............. Deploy to nilenso.com production server"
	@echo "install-planet-sh ... Install planet nilenso blog (run as deply)"
	@echo
