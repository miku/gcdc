help:
	@echo make setup-linux
	@echo make setup-darwin

setup-linux: downloads/google_appengine downloads/go_appengine_linux dev_appserver.py appcfg.py symlink-goapp-linux

setup-osx: downloads/google_appengine downloads/go_appengine_darwin dev_appserver.py appcfg.py symlink-goapp-darwin
	
downloads/:
	mkdir -p downloads

# Go
downloads/go_appengine_sdk_linux_amd64-1.8.7.zip: downloads/
	cd downloads && wget http://googleappengine.googlecode.com/files/go_appengine_sdk_linux_amd64-1.8.7.zip

downloads/go_appengine_linux/: downloads/go_appengine_sdk_linux_amd64-1.8.7.zip
	cd downloads && unzip -d linux go_appengine_sdk_linux_amd64-1.8.7.zip

downloads/go_appengine_sdk_darwin_amd64-1.8.7.zip: downloads/
	cd downloads && wget https://googleappengine.googlecode.com/files/go_appengine_sdk_darwin_amd64-1.8.7.zip

downloads/go_appengine_darwin/: downloads/go_appengine_sdk_darwin_amd64-1.8.7.zip
	cd downloads && unzip -d darwin go_appengine_sdk_darwin_amd64-1.8.7.zip 

# Python
downloads/google_appengine_1.8.7.zip: downloads/
	cd downloads && wget http://googleappengine.googlecode.com/files/google_appengine_1.8.7.zip

downloads/google_appengine/: downloads/google_appengine_1.8.7.zip
	cd downloads && unzip google_appengine_1.8.7.zip

# Dev tools
dev_appserver.py:
	ln -s downloads/google_appengine/dev_appserver.py

appcfg.py:
	ln -s downloads/google_appengine/appcfg.py

symlink-goapp-linux:
	rm -f goapp
	ln -s downloads/linux/go_appengine/goapp goapp

symlink-goapp-darwin:
	rm -f goapp
	ln -s downloads/darwin/go_appengine/goapp goapp

# Cleanup
clean:
	rm -rf downloads
