.DEFAULT_GOAL:=all

LIB_NAME=cspice

IDIR =../../include
CC=gcc
CFLAGS=-I$(IDIR) -ansi -m64 -O2 -DNON_UNIX_STDIO

ODIR=obj
LDIR =../../lib

LIBS=-lm -m64

DEPS=$(wildcard $(IDIR)/*.h)

_SRC=$(wildcard *.c)
_OBJ=$(_SRC:.c=.o)
OBJ=$(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -o $@ $< $(CFLAGS)

$(LDIR)/$(LIB_NAME).a: $(OBJ)
	@mkdir -p $(LDIR) || true
	ar cr $@ $(OBJ)
	ranlib $@

.PHONY: clean all

all: $(LDIR)/$(LIB_NAME).a

clean:
	rm -Rf $(ODIR) *~ core $(INCDIR)/*~ $(LDIR)/$(LIB_NAME).a
