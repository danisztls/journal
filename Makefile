PROJECT = journal
VERSION = 1.1

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
SHAREDIR = $(PREFIX)/share/journal

INSTALL_DIR = install -p -d
INSTALL_PROGRAM = install -p -m755
INSTALL_DATA = install -p -m644

common/$(PROJECT):
	@printf '\n\e[1;32m%s\e[0m\n' "Run make install..."

test:
	@printf '\n\e[1;32m%s\e[0m\n' "Testing..."
	./test.sh

install:
	@printf '\n\e[1;32m%s\e[0m\n' "Testing..."
	./test.sh || exit 1

	@printf '\n\e[1;32m%s\e[0m\n' "Installing program..."
	$(INSTALL_DIR) "$(DESTDIR)$(BINDIR)"
	$(INSTALL_PROGRAM) journal "$(DESTDIR)$(BINDIR)"
	$(INSTALL_DIR) "$(DESTDIR)$(SHAREDIR)"
	$(INSTALL_DATA) ignore "$(DESTDIR)$(SHAREDIR)"

uninstall:
	@printf '\n\e[1;32m%s\e[0m\n' "Uninstalling program..."
	rm "$(DESTDIR)$(BINDIR)/journal"
	rm "$(DESTDIR)$(SHAREDIR)/ignore"
	rmdir "$(DESTDIR)$(SHAREDIR)"

.PHONY: test install uninstall
