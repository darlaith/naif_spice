.DEFAULT_GOAL:=all

BIN_NAME=$(subst .pgm,,$(wildcard *.pgm))

BDIR =../../exe
IDIR =../../include
CC=gcc
CFLAGS=-I$(IDIR) -ansi -m64 -O2 -DNON_UNIX_STDIO

ODIR=obj
LDIR =../../lib

LIBS=-lm -m64

DEPS=$(wildcard $(IDIR)/*.h)

_SRC=$(wildcard *.c)
_OBJ=$(_SRC:.c=.o) main.o $(BIN_NAME).o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(LDIR)/cspice.a:
	$(MAKE) -C ../cspice

$(LDIR)/csupport.a:
	$(MAKE) -C ../csupport

$(ODIR)/%.o: %.c $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/main.o: main.x $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -x c -o $@ $< $(CFLAGS)

$(ODIR)/$(BIN_NAME).o: $(BIN_NAME).pgm $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -x c -o $@ $< $(CFLAGS)

$(BDIR)/$(BIN_NAME): $(OBJ) $(LDIR)/cspice.a $(LDIR)/csupport.a
	$(CC) -o $@ $^ $(CFLAGS) $(LDIR)/cspice.a $(LDIR)/csupport.a $(LIBS)
	
.PHONY: clean all

all: $(BDIR)/$(BIN_NAME)

clean:
	rm -Rf $(ODIR) *~ core $(INCDIR)/*~
	rm -f $(BDIR)/$(BIN_NAME)
