.DEFAULT_GOAL:=all

SDIR =src
IDIR =include
CC=gcc
CFLAGS=-I$(IDIR) -ansi -m64 -O2 -DNON_UNIX_STDIO

LDIR=lib
BDIR=exe

LIBS=-lm -m64

SRC_DIRS=$(wildcard $(SDIR)/*)

$(BDIR)/brief:
	$(MAKE) -C $(SDIR)/brief_c

$(BDIR)/commnt:
	$(MAKE) -C $(SDIR)/commnt_c

$(BDIR)/subpt:
	$(MAKE) -C $(SDIR)/cook_c ../../$(BDIR)/subpt

$(BDIR)/dskexp:
	$(MAKE) -C $(SDIR)/dskexp_c

$(BDIR)/mkdsk:
	$(MAKE) -C $(SDIR)/mkdsk_c

$(BDIR)/spacit:
	$(MAKE) -C $(SDIR)/spacit_c

$(BDIR)/tobin:
	$(MAKE) -C $(SDIR)/tobin_c

$(BDIR)/chronos:
	$(MAKE) -C $(SDIR)/chrnos_c

$(BDIR)/simple:
	$(MAKE) -C $(SDIR)/cook_c ../../$(BDIR)/simple

$(BDIR)/tictoc:
	$(MAKE) -C $(SDIR)/cook_c ../../$(BDIR)/tictoc

$(BDIR)/frmdiff:
	$(MAKE) -C $(SDIR)/frmdif_c

$(BDIR)/mkspk:
	$(MAKE) -C $(SDIR)/mkspk_c

$(BDIR)/spkdiff:
	$(MAKE) -C $(SDIR)/spkdif_c

$(BDIR)/toxfr:
	$(MAKE) -C $(SDIR)/toxfr_c

$(BDIR)/ckbrief:
	$(MAKE) -C $(SDIR)/ckbref_c

$(BDIR)/states:
	$(MAKE) -C $(SDIR)/cook_c ../../$(BDIR)/states

$(BDIR)/dskbrief:
	$(MAKE) -C $(SDIR)/dskbrief_c

$(BDIR)/inspekt:
	$(MAKE) -C $(SDIR)/inspkt_c

$(BDIR)/msopck:
	$(MAKE) -C $(SDIR)/msopck_c

$(BDIR)/spkmerge:
	$(MAKE) -C $(SDIR)/spkmrg_c

$(BDIR)/version:
	$(MAKE) -C $(SDIR)/versn_c

$(LDIR)/cspice.a:
	$(MAKE) -C $(SDIR)/cspice

$(LDIR)/csupport.a:
	$(MAKE) -C $(SDIR)/csupport

binaries: $(BDIR)/brief $(BDIR)/commnt $(BDIR)/subpt $(BDIR)/dskexp\
 $(BDIR)/mkdsk $(BDIR)/spacit $(BDIR)/tobin $(BDIR)/chronos\
 $(BDIR)/simple $(BDIR)/tictoc $(BDIR)/frmdiff $(BDIR)/mkspk\
 $(BDIR)/spkdiff $(BDIR)/toxfr $(BDIR)/ckbrief $(BDIR)/states\
 $(BDIR)/dskbrief $(BDIR)/inspekt $(BDIR)/msopck $(BDIR)/spkmerge\
 $(BDIR)/version

libraries: $(LDIR)/cspice.a $(LDIR)/csupport.a

.PHONY: clean all

all: libraries binaries

clean:
	for dir in $(SRC_DIRS); do\
	  $(MAKE) -C $$dir clean;\
	done
