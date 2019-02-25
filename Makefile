# Makefile for building arp_set
#
# Makefile targets:
#
# all/install   build and install the NIF
# clean         clean build products and intermediates
#
# Variables to override:
#
# MIX_COMPILE_PATH path to the build's ebin directory
#
# CFLAGS	compiler flags for compiling all C files
# LDFLAGS	linker flags for linking all binaries

PREFIX = $(MIX_COMPILE_PATH)/../priv
BUILD  = $(MIX_COMPILE_PATH)/../obj
BIN = $(PREFIX)/arp_set

CFLAGS ?= -O2 -Wall -Wextra -Wno-unused-parameter

SRC = src/arp_set.c
OBJ = $(SRC:src/%.c=$(BUILD)/%.o)

calling_from_make:
	mix compile

all: install

install: $(PREFIX) $(BUILD) $(BIN)

$(OBJ): Makefile

$(BUILD)/%.o: src/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

$(BIN): $(OBJ)
	$(CC) -o $@ $(LDFLAGS) $^

$(PREFIX) $(BUILD):
	mkdir -p $@
clean:
	$(RM) $(BIN) $(BUILD)/*.o

.PHONY: all clean calling_from_make install
