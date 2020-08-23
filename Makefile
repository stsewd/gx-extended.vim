EXTRA_OPTIONS?=
VIM_BIN?=nvim

test:
	$(VIM_BIN) $(EXTRA_OPTIONS) -u tests/init.vim -c "Vader! tests/**" > /dev/null

setup:
	git clone --depth=1 https://github.com/junegunn/vader.vim.git

.PHONY: test setup
