PACKAGE = ige-mac-bundler
VERSION = 0.1

bindir=$(HOME)/bin

all:
	@echo 'Run "make install" to install.'

install:
	@mkdir -p $(bindir)
	@sed "s,@PATH@,`pwd`,g" < ige-mac-bundler.in > $(bindir)/ige-mac-bundler
	@chmod a+x $(bindir)/ige-mac-bundler

distdir = $(PACKAGE)-$(VERSION)
dist:
	-rm -rf $(distdir)
	mkdir $(distdir)
	cp -p README COPYING NEWS Makefile ige-mac-bundler.in launcher.sh *.py $(distdir)/
	mkdir $(distdir)/examples
	cp -p examples/* $(distdir)/examples/
	chmod -R a+r $(distdir)
	tar czf $(distdir).tar.gz $(distdir)
	rm -rf $(distdir)

.PHONY: all install