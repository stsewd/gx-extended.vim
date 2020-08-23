EXTRA_OPTIONS?=

test:
	nvim $(EXTRA_OPTIONS) -u tests/init.vim -c "Vader! tests/**" > /dev/null

.PHONY: test
