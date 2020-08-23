test:
	nvim --headless -u tests/init.vim -c "Vader! tests/**" > /dev/null
