CC?=gcc
PREFIX?=/usr/local
LIBRARY=libsdaiasrv
INSTALL_DIR=$(PREFIX)/lib
INCLUDE_DIR=$(PREFIX)/include/$(LIBRARY)

S_SRC= 
S_OBJS=	$(S_SRC:.c=.o)

CFLAGS+=-Wall -Werror -Wstrict-prototypes -Wmissing-prototypes
CFLAGS+=-Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual
CFLAGS+=-Wsign-compare -Iincludes -std=c99 -pedantic
LDFLAGS=

ifneq ("$(DEBUG)", "")
	CFLAGS+= -g
	NOOPT=1
endif

ifneq ("$(NOOPT)", "")
	CFLAGS+=-O0
else
	CFLAGS+=-O2
endif

$(LIBRARY): $(S_OBJS)
	$(CC) $(S_OBJS) $(LDFLAGS) -shared -o $(LIBRARY)

all: $(LIBRARY)

install:
	mkdir -p $(INCLUDE_DIR)
	mkdir -p $(INSTALL_DIR)
	install -m 555 $(LIBRARY) $(INSTALL_DIR)/$(LIBRARY)
	install -m 644 includes/*.h $(INCLUDE_DIR)

uninstall:
	rm -f $(INSTALL_DIR)/$(LIBRARY)
	rm -rf $(INCLUDE_DIR)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	find . -type f -name \*.o -exec rm {} \;
	rm -f $(LIBRARY)

.PHONY: all clean


