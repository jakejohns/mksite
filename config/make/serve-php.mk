# Directories
pub_dir ?= public

# Dependencies
PHP ?= php

# Options
SERVE_PORT ?= 8000

.PHONY : serve
serve : ## serve pub_dir with php
	$(PHP) --server localhost:$(SERVE_PORT) --docroot $(pub_dir)
