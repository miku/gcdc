setup: downloads/google_appengine downloads/go_appengine dev_appserver.py appcfg.py goapp
	
downloads/:
	mkdir -p downloads

# Go
downloads/go_appengine_sdk_linux_amd64-1.8.7.zip: downloads/
	cd downloads && wget http://googleappengine.googlecode.com/files/go_appengine_sdk_linux_amd64-1.8.7.zip

downloads/go_appengine/: downloads/go_appengine_sdk_linux_amd64-1.8.7.zip
	cd downloads && unzip go_appengine_sdk_linux_amd64-1.8.7.zip

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

goapp:
	ln -s downloads/go_appengine/goapp

# Cleanup
clean:
	rm -rf downloads
