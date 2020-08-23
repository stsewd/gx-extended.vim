EXTRA_OPTIONS?=
VIM_BIN?=nvim

test:
	$(VIM_BIN) $(EXTRA_OPTIONS) -u tests/init.vim -c "Vader! tests/**" > /dev/null

.PHONY: test
