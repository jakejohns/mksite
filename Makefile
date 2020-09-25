MAKEFLAGS += --no-builtin-rules --no-builtin-variables --warn-undefined-variables
.DELETE_ON_ERROR :
.DEFAULT_GOAL := all

# Directories
src_dir = src
pub_dir = public
cfg_dir = config
rsc_dir = resources

-include $(cfg_dir)/make/config.mk

include $(cfg_dir)/make/pandoc-html.mk
include $(cfg_dir)/make/sign-html.mk
include $(cfg_dir)/make/sassc-css.mk
include $(cfg_dir)/make/deploy.mk
include $(cfg_dir)/make/serve-php.mk
# include $(cfg_dir)/make/serve-python.mk

.PHONY : help
help :
	@{ printf 'GOAL : DESC\n'; grep -h ':.*##' $(MAKEFILE_LIST) | grep -v grep | sed 's/:.*##/:/'; } | column -t -s ':'

.PHONY : watch
watch : ## continuously make
	while true; do $(MAKE) --no-print-directory --question || $(MAKE); sleep 1; done

.PHONY : all
all : $(ALL_GOALS) ## make all the things

.PHONY : clean
clean : $(CLEAN_GOALS) ## clean all the things
