.DEFAULT_GOAL:=all

BIN_NAME=$(subst .pgm,,$(wildcard *.pgm))

IDIR =../../include
CC=gcc
CFLAGS=-I$(IDIR) -ansi -m64 -O2 -DNON_UNIX_STDIO

ODIR=obj
LDIR =../../lib

LIBS=-lm -m64

_DEPS=$(wildcard *.h)
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_SRC=$(wildcard *.c)
_OBJ=$(_SRC:.c=.o) main.o $(BIN_NAME).o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/main.o: main.x $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -x c -o $@ $< $(CFLAGS)

$(ODIR)/$(BIN_NAME).o: $(BIN_NAME).pgm $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -x c -o $@ $< $(CFLAGS)

$(BIN_NAME): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
	
.PHONY: clean all

all: $(BIN_NAME)

clean:
	rm -Rf $(ODIR) *~ core $(INCDIR)/*~
