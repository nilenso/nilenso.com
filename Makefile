.PHONY:	help ? tests

serve:
	middleman

build:
	middleman build

clean:
	rm -r build

deploy:
	git push production master

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
	@echo "build ............... Build nilenso.com static site"
	@echo "deploy .............. Deploy to nilenso.com production server"
	@echo
