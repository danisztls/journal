PROJECT = journal
VERSION = 1.1

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
SHAREDIR = $(PREFIX)/share/journal

INSTALL_DIR = install -p -d
INSTALL_PROGRAM = install -p -m755
INSTALL_DATA = install -p -m644

common/$(PROJECT):
	@echo -e '\e[1;32mRun make install...\e[0m'

install:
	@echo -e '\e[1;32mInstalling program...\e[0m'
	$(INSTALL_DIR) "$(DESTDIR)$(BINDIR)"
	$(INSTALL_PROGRAM) journal "$(DESTDIR)$(BINDIR)"
	$(INSTALL_DIR) "$(DESTDIR)$(SHAREDIR)"
	$(INSTALL_DATA) ignore "$(DESTDIR)$(SHAREDIR)"
	$(INSTALL_DATA) syntax/journal.vim "$(DESTDIR)$(SHAREDIR)"

uninstall:
	@echo -e '\e[1;32mUninstalling program...\e[0m'
	rm "$(DESTDIR)$(BINDIR)/journal"
	rm "$(DESTDIR)$(SHAREDIR)/ignore"
	rm "$(DESTDIR)$(SHAREDIR)/journal.vim"
	rmdir "$(DESTDIR)$(SHAREDIR)"

.PHONY: install uninstall
