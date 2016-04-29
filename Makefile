CC?=gcc
LIBRARY=libsdaiasrv.so
PREFIX?=/usr/local
INSTALL_DIR=$(PREFIX)/lib/SDAIA
INCLUDE_DIR=$(PREFIX)/include/SDAIA

build:
	kore build

install:
	mkdir -p $(INCLUDE_DIR)
	mkdir -p $(INSTALL_DIR)
	install -m 555 $(LIBRARY) $(INSTALL_DIR)/$(LIBRARY)
	install -m 644 includes/*.h $(INCLUDE_DIR)

uninstall:
	rm -f $(INSTALL_DIR)/$(LIBRARY)
	rm -rf $(INCLUDE_DIR)
	
clean:
	kore clean
