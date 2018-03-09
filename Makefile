# Variables to override
#
# CFLAGS	compiler flags for compiling all C files
# LDFLAGS	linker flags for linking all binaries

LDFLAGS +=
CFLAGS ?= -O2 -Wall -Wextra -Wno-unused-parameter

.PHONY: all clean

SRC = src/arp_set.c
TARGET = priv/arp_set

all: priv/arp_set

priv:
	mkdir -p priv

$(TARGET): priv $(SRC)
	$(CC) $(SRC) $(CFLAGS) $(LDFLAGS) -o $@

clean:
	rm -f $(TARGET)
