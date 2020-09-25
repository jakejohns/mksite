# Directories
pub_dir ?= public

# Dependencies
PYTHON ?= python

# Options
SERVE_PORT ?= 8000

.PHONY : serve
serve : ## serve pub_dir with python
	cd $(pub_dir); $(PYTHON) -m http.server $(SERVE_PORT)
