
## initialize direnv
direnv: direnv/vars
	-[ -f .envrc ] && direnv allow

## initialize direnv vars from example
direnv/vars:
	-[ -f .vars.example ] && cp .vars.example .vars
