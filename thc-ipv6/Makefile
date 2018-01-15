CC=gcc
#CFLAGS=-g
CFLAGS=-Ofast -falign-functions -falign-jumps -falign-loops -falign-labels -freorder-blocks -freorder-blocks-and-partition
CFLAGS+=$(if $(HAVE_SSL),-D_HAVE_SSL,)
LDFLAGS+=-lpcap $(if $(HAVE_SSL),-lssl -lcrypto,)
STATIC=
#-static
PROGRAMS=detect-new-ip6
LIBS=thc-ipv6-lib.o
STRIP=strip

PREFIX=/usr/local
MANPREFIX=${PREFIX}/share/man

all:	$(LIBS) $(PROGRAMS)

%:	%.c $(LIBS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(STATIC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(PROGRAMS) $(LIBS) core DEADJOE *~


%.8: %
	@echo .TH $* 8 `date --iso-8601` THC "IPv6 ATTACK TOOLKIT" > $@
	@echo .SH NAME >> $@
	@echo .B $* >> $@
	@./$*|tail -n +2|sed -e "s#\\./$*#$*#g" -e "s/^Syntax: \?/.SH SYNOPSIS\n/g" -e "s/Options:/.SH OPTIONS\n.nf\n/g" -e "s/^\(.*\):\$$/.SH \1\n/g" >> $@
	@echo .SH AUTHOR >> $@
	@echo "thc-ipv6 was written by van Hauser <vh@thc.org> / THC" >> $@
	@echo >> $@
	@echo  The homepage for this toolkit is: http://www.thc.org/thc-ipv6 >> $@
	@echo >> $@
	@echo .SH COPYRIGHT >> $@
	@./$* |head -n1|sed -e "s#^\./##g" >> $@

.PHONY: all install clean man
