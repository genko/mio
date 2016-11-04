EXAMPLES = calc

CFLAGS = -g -O3

DIFF = diff
TEE = cat >

all : $(EXAMPLES)

calc :
	leg -o calc.leg.c calc.leg
	$(CC) $(CFLAGS) -o calc calc.leg.c
	echo 'a = 6;  b = 7;  a * b' | ./calc | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

clean : 
	rm -f *~ *.o *.[pl]eg.[cd] $(EXAMPLES)
	rm -rf *.dSYM

.PHONY: clean
