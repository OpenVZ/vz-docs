ASC_FILES := $(wildcard *.asc)

PDF_DIR := pdf
PDF_FILES := $(patsubst %.asc, $(PDF_DIR)/%.pdf, $(ASC_FILES))

ANT_DIR := ant
ANT_FILES := $(patsubst %.asc, $(ANT_DIR)/$%.xml, $(ASC_FILES))

XML_DIR := xml
XML_FILES := $(patsubst %.asc, $(XML_DIR)/$%.xml, $(ASC_FILES))

HTML_DIR := html
HTML_FILES := $(patsubst %.asc, $(HTML_DIR)/%.webhelp, $(ASC_FILES))

.PHONY: clean

all: $(PDF_FILES) $(HTML_FILES)

$(PDF_DIR)/%.pdf: %.asc
	mkdir -p $(PDF_DIR)
	a2x -L -a docinfo1 -f pdf -r images --fop --xsl-file=stylesheets/virtuozzo.fo.xsl -D $(PDF_DIR)/ $<

$(ANT_DIR)/%.xml: %.asc
	mkdir -p ant
	echo "\
	<project>\
	  <property name=\"xslt-processor-classpath\" value=\"/usr/share/java/saxon.jar\"/>\
	  <property name=\"xercesImpl.jar\" value=\"/usr/share/java/xerces-j2.jar\"/>\
	  <property name=\"xml-apis.jar\" value=\"/usr/share/java/xml-commons-apis.jar\"/>\
	  <property name=\"input-xml\" value=\"../$(XML_DIR)/`echo $<|sed 's/\.asc/.xml/'`\"/>\
	  <property name=\"output-dir\" value=\"../$(HTML_DIR)/`echo $<|sed 's/\.asc/.webhelp/'`\"/>\
	  <property name=\"stylesheet-path\" value=\"../stylesheets/virtuozzo.webhelp.xsl\"/>\
	  <import file=\"/usr/share/sgml/docbook/xsl-ns-stylesheets/webhelp/build.xml\"/>\
	</project>\
	" > $@

$(XML_DIR)/%.xml: %.asc
	mkdir -p xml
	a2x -vL -a docinfo1 -r images -f docbook -D $(XML_DIR)/ $<

$(HTML_DIR)/%.webhelp: $(ANT_DIR)/%.xml $(XML_DIR)/%.xml
	mkdir -p $(HTML_DIR)
	ant webhelp -buildfile $<
	cp stylesheets/virtuozzo.webhelp.stylesheet.css $@/common/css
	cp stylesheets/odin-logo-white.png $@/common/images
	rm $@/common/main.js
	cp stylesheets/main.js $@/common
	rm $@/favicon.ico
	cp stylesheets/favicon.ico $@/


clean:
	rm -rvf $(PDF_DIR)/* $(HTML_DIR)/* $(ANT_DIR)/* $(XML_DIR)/*
