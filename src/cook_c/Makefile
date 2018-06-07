.DEFAULT_GOAL:=all

BIN_NAMES=$(patsubst %.pgm,%,$(wildcard *.pgm))

BDIR =../../exe
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

$(LDIR)/cspice.a:
	$(MAKE) -C ../cspice

define make-binobj-target
$(ODIR)/$1.o: $1.pgm $(DEPS)
	@mkdir -p $(ODIR) || true
	$(CC) -c -x c -o $(ODIR)/$1.o $1.pgm $(CFLAGS)
$(BDIR)/$1: $(ODIR)/$1.o $(OBJ) $(LDIR)/cspice.a
	@mkdir -p $(BDIR) || true
	$(CC) -o $(BDIR)/$1 $(ODIR)/$1.o $(OBJ) $(CFLAGS) -L$(LDIR) $(LDIR)/cspice.a $(LIBS)
all:: $(BDIR)/$1
endef
$(foreach element,$(BIN_NAMES),$(eval $(call make-binobj-target,$(element))))

.PHONY: clean all

clean:
	rm -Rf $(ODIR) *~ core
	rm -f $(foreach element,$(BIN_NAMES), $(BDIR)/$(element))
