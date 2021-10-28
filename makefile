

BUILD_DIR		?= build

OUTPUT_FORMAT	?= pdf

BUILD_DIR		:= build
WGET_DIR		:= $(BUILD_DIR)/wget



$(BUILD_DIR):
	mkdir -p $(BUILD_DIR) $(WGET_DIR)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)



nix-pills: $(BUILD_DIR) nix-pills-content
	pandoc $(shell \
			grep -orPm 1 --color=never '[\d.]{2,}\x2e[^<>]+?</h2>' $(WGET_DIR)/nix-pills/*.html |\
			sort -Vt: -k2 | cut -d: -f1 ) \
		-o $(BUILD_DIR)/nix-pills.$(OUTPUT_FORMAT) \
		--toc \
		--standalone

nix-pills-content: nix-pills-download
	sed \
		-e 's@<head>.*</head>@@' \
		-e 's@<header>.*</header>@@' \
		-e 's@<footer>.*</footer>@@' \
		-e 's@<div.*<h1>Nix Pills</h1></div>@@' \
		-e 's@<li[^>]*><a accesskey[^>]*>[^<]*</a></li>@@g' \
		-zi $(WGET_DIR)/nix-pills/*.html

#--page-requisites
#--debug
#--execute robots=off
nix-pills-download: $(BUILD_DIR)
	wget \
		--recursive \
		--convert-links \
		--random-wait \
		--no-directories \
		--no-clobber \
		--timestamping \
		--no-parent \
		--domains=nixos.org \
		--directory-prefix $(WGET_DIR)/nix-pills \
		--include-directories=guides/nix-pills \
		--level=1 \
		https://nixos.org/guides/nix-pills
