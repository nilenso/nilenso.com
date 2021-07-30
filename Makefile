.PHONY:	download ? serve

serve:
	zola serve

download:
	./bin/download-site

help: ?

?:
	@echo "===================="
	@echo " nilenso.com \\ help"
	@echo "===================="
	@echo
	@echo "download ........... Downloads the raw site from dashpad"
	@echo "serve .............. Start dev server locally"
	@echo
