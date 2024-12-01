FILES_DIR := files
VARS_DIR := vars
OUT_DIR := out

SRC_FILES := $(shell find $(FILES_DIR) -type f)

OUT_FILES := $(patsubst $(FILES_DIR)/%, $(OUT_DIR)/%, $(SRC_FILES))
VAR_FILES := $(patsubst $(FILES_DIR)/%, $(VARS_DIR)/%, $(SRC_FILES))

default:
	make $(shell hostname)

dry:
	DRY=echo make default

unagi:
	sh install.sh configs/unagi.sh

shellcheck:
	find . -type f -name '*.sh' | while read -r name; do \
	 	shellcheck -e1090,2086,1091 "$$name"; \
	done

dots: $(OUT_FILES)

$(OUT_DIR)/%: $(FILES_DIR)/% $(VARS_DIR)/%
	mkdir -p $(shell dirname $@)
	sh build_dot.sh $< $(word 2, $^) $@

$(OUT_DIR)/%: $(FILES_DIR)/%
	mkdir -p $(shell dirname $@)
	cp $< $@

clean:
	rm -rf $(OUT_DIR)

.PHONY: default dots clean unagi
