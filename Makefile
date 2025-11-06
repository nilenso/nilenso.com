.PHONY:	download ? serve build-css watch-css build

build-css:
	./bin/build-css

watch-css:
	npm run watch:css

serve: build-css
	zola serve

build: build-css
	zola build

get-site:
	./bin/download-site

get-yt-thumbnails:
	./bin/download-yt-thumbnails $(CURDIR)

help: ?

?:
	@echo "===================="
	@echo " nilenso.com \\ help"
	@echo "===================="
	@echo
	@echo "build ............... Build the site (CSS + Zola)"
	@echo "build-css ........... Build CSS with Tailwind"
	@echo "watch-css ........... Watch and rebuild CSS on changes"
	@echo "serve ............... Start dev server locally (builds CSS first)"
	@echo "get-site ............ Downloads the raw site from dashpad"
	@echo "get-yt-thumbnails ... Downloads the YouTube image thumbnails"
	@echo
