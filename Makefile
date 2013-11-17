help:
	@echo make setup-linux
	@echo make setup-darwin

setup-linux: downloads/google_appengine/ downloads/go_appengine_linux/ symlink-gae symlink-goapp-linux

setup-osx: downloads/google_appengine/ downloads/go_appengine_darwin/ symlink-gae symlink-goapp-darwin

bin/:
	mkdir -p bin

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
symlink-gae: bin/
	find downloads/google_appengine -depth 1 -type f -name "*py" | xargs -I{} ln -s ../{} bin/

symlink-goapp-linux: bin/
	rm -f bin/goapp
	ln -s downloads/linux/go_appengine/goapp bin/goapp

symlink-goapp-darwin: bin/
	rm -f bin/goapp
	ln -s downloads/darwin/go_appengine/goapp bin/goapp

# Cleanup
clean:
	rm -rf downloads
	rm -rf bin
