PREFIX ?= /usr/local
BINS = $(wildcard bin/git-*)

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/lib
	@echo "... installing library to $(DESTDIR)$(PREFIX)/lib"
	@cp -f lib/gitano $(DESTDIR)$(PREFIX)/lib/gitano
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@echo "... installing bins to $(DESTDIR)$(PREFIX)/bin"
	@$(foreach BIN, $(BINS), \
		echo "... installing `basename $(BIN)`"; \
		cp -f $(BIN) $(DESTDIR)$(PREFIX)/$(BIN); \
	)

uninstall:
	@rm $(DESTDIR)$(PREFIX)/lib/gitano
	@$(foreach BIN, $(BINS), \
		echo "... uninstalling $(DESTDIR)$(PREFIX)/$(BIN)"; \
		rm -f $(DESTDIR)$(PREFIX)/$(BIN); \
	)

.PHONY: install uninstall
