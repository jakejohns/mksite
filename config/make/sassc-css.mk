# Directories
pub_dir ?= public
rsc_dir ?= resources

# Dependencies
SASS ?= sassc

# Options
SASS_OPT ?= --style compressed

# Source/Destination
src_css_dir ?= $(rsc_dir)/style
src_css ?= $(src_css_dir)/style.scss
pub_css ?= $(pub_dir)/assets/css/style.css

# Goals
ALL_GOALS += css
CLEAN_GOALS += clean-css

.PHONY : css
css : $(pub_css) ## make css

$(pub_css) : $(src_css) $(src_css_dir)
	@mkdir -p $(dir $@)
	$(SASS) $(SASS_OPT) $< > $@

.PHONY : clean-css
clean-css : ## clean css
	rm -f $(pub_css)
	rmdir --ignore-fail-on-non-empty $(dir $(pub_css))
