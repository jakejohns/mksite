# Directories
pub_dir ?= public

# Dependencies
RSYNC ?= rsync

# Options
RSYNC_OPT ?= --recursive --verbose --compress --update --delete --checksum --exclude .well-known

.PHONY : deploy
deploy : all ## deploy site with rsync (must set REMOTE variable)
	$(RSYNC) $(RSYNC_OPT) $(pub_dir)/ $(REMOTE)
