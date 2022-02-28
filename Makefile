.PHONY:	download ? serve

serve:
	zola serve

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
	@echo "get-site ............ Downloads the raw site from dashpad"
	@echo "get-yt-thumbnails ... Downloads the YouTube image thumbnails"
	@echo "serve ............... Start dev server locally"
	@echo
