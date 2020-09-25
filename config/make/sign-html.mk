# Directories
src_dir ?= src
pub_dir ?= public

# Dependencies
GPG ?= gpg

# Options
GPG_OPT ?= --yes --armor
PANDOC_OPT += --metadata=signed

# Source/Destination
src_mds ?= $(shell find $(src_dir) -name '*.md')
pub_htmls ?= $(patsubst $(src_dir)/%.md,$(pub_dir)/%.html,$(src_mds))
pub_sigs ?= $(patsubst %.html,%.html.asc,$(pub_htmls))

# Goals
ALL_GOALS += sigs
CLEAN_GOALS += clean-sigs

.PHONY : sigs
sigs : $(pub_sigs) ## generate detached gpg signatures for html docs

$(pub_dir)/%.html.asc: $(pub_dir)/%.html
	$(GPG) $(GPG_OPT) --detach-sign $<

.PHONY : clean-sigs
clean-sigs : ## clean signatures
	rm -f $(pub_sigs)
