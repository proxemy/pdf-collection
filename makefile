

BUILD_DIR		?= build

OUTPUT_FORMAT	?= pdf



$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(TEMP_DIR)



nix-pills.$(OUTPUT_FORMAT): $(BUILD_DIR) nix-pills-content
	pandoc $( \
			env ls $(TEMP_DIR)/'*.html' | \
			env grep -orPm 1 '[\d.]{2,}\x2e[^<>]+?</h2>' | \
			env awk -F':' '{print $2":"$1"\n"}' | sort -V | cut -d ':' -f2 \
		) -o $(BUILD_DIR)/nix-pills.$(OUTPUT_FORMAT)
	# TODO dynamic output format


nix-pills-content: nix-pills-download nix-pills-clean


.PHONY nix-pills-download:
	wget -r







.PHONY:



wget -prkl 1 -D nixos.org https://nixos.org/guides/nix-pills -I guides/nix-pills
wget -prkl 1 -D nixos.org https://nixos.org/guides/nix-pills -I guides/nix-pills
wget -prk -D nixos.org https://nixos.org/guides/nix-pills -I nix-pills
wget -prk -D nixos.org https://nixos.org/guides/nix-pills
wget -prk -D nixos.org https://nixos.org/guides/nix-pills -I nix-pills
wget -prk -D nixos.org https://nixos.org/guides/nix-pills -I guides


