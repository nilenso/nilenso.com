.PHONY:	help ? tests

build:
	middleman build

add-remote:
	git remote add production ssh://www@nilenso.com/home/wwww/repos/nilenso.com.git

deploy:
	git push production master

print-server-hook:
	@echo \#!/bin/sh
	@echo git --work-tree=/home/www/nilenso.com --git-dir=/home/wwww/repos/nilenso.com.git checkout -f

help: ?

?:
	@echo
	@echo "add-remote .......... Add the production server as a git remote"
	@echo "print-server-hook ... Print the hook to add the production server"
	@echo "build ............... Build nilenso.com static site"
	@echo "deploy .............. Deploy to nilenso.com production server"
	@echo
