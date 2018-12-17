all:
	$(MAKE) -C src
	mv src/latc .

clean:
	$(MAKE) clean -C src
	-rm -f latc

distclean: clean
	$(MAKE) distclean -C src	

