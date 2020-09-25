# Directories
src_dir ?= src
pub_dir ?= public
cfg_dir ?= config
rsc_dir ?= resources

# Dependencies
PANDOC ?= pandoc
TIDY ?= tidy

# Configs
PANDOC_DATA_DIR ?= $(cfg_dir)/pandoc
PANDOC_DEFAULTS ?= defaults
TIDY_CONFIG ?= $(cfg_dir)/tidy.yaml
UPDATED ?= $(shell date --iso-8601=minute)

# Options
PANDOC_OPT ?= --data-dir $(PANDOC_DATA_DIR) --defaults $(PANDOC_DEFAULTS) --metadata=updated:$(UPDATED)
TIDY_OPT ?= -config $(TIDY_CONFIG)

# Source/Destination
src_mds ?= $(shell find $(src_dir) -name '*.md')
pub_htmls ?= $(patsubst $(src_dir)/%.md,$(pub_dir)/%.html,$(src_mds))

# Goals
ALL_GOALS += html
CLEAN_GOALS += clean-html

.PHONY : html
html : $(pub_htmls) ## build html from src_dir markdown with pandoc

$(pub_dir)/%.html : $(src_dir)/%.md $(cfg_dir) $(rsc_dir)
	@mkdir -p $(dir $@)
	$(PANDOC) $(PANDOC_OPT) --metadata=filename:$(notdir $@) < $< | $(TIDY) $(TIDY_OPT) > $@

.PHONY : clean-html
clean-html : ## clean html
	rm -f $(pub_htmls)
	rmdir --ignore-fail-on-non-empty $(dir $(pub_htmls))
