all::
	@echo "make install run"

install::
	sudo mkdir -p /dev/nodemcu
	sudo chgrp dialout /dev/nodemcu
	sudo chmod g+rw /dev/nodemcu
	sudo cp nodemcu-enum /usr/local/bin/

run::
	nodemcu-enum

