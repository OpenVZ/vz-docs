ASC_FILES := $(wildcard *.asc)
PDF_DIR := pdf
PDF_FILES := $(patsubst %.asc, $(PDF_DIR)/%.pdf, $(ASC_FILES))
HTML_DIR := html
HTML_FILES := $(patsubst %.asc, $(HTML_DIR)/%.chunked, $(ASC_FILES))

.PHONY: clean

all: $(PDF_FILES) $(HTML_FILES)

$(PDF_DIR)/%.pdf: %.asc
	mkdir -p $(PDF_DIR)
	a2x -L -a docinfo1 -f pdf --fop --xsl-file=stylesheets/virtuozzo.fo.xsl -D $(PDF_DIR)/ $<

$(HTML_DIR)/%.chunked: %.asc
	mkdir -p $(HTML_DIR)
	a2x -L -a docinfo1 -f chunked --xsl-file=stylesheets/virtuozzo.html.xsl -D $(HTML_DIR)/ $<

clean:
	rm -rvf $(PDF_DIR)/* $(HTML_DIR)/*
