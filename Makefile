ifndef SAXONPATH
  SAXONPATH = /usr/share/java/saxon.jar
endif

ASC_FILES := $(wildcard *.asc)

PDF_FILES := $(patsubst %.asc, %.pdf, $(ASC_FILES))

ANT_FILES := $(patsubst %.asc, %_build.xml, $(ASC_FILES))

XML_DIR := xml
XML_FILES := $(patsubst %.asc, $(XML_DIR)/%.xml, $(ASC_FILES))

HTML_FILES := $(patsubst %.asc, %.webhelp, $(ASC_FILES))

.PHONY: clean

all: $(PDF_FILES) $(HTML_FILES)

%.pdf: %.asc
	a2x -vL -a docinfo1 -f pdf -r images --fop --xsl-file=stylesheets/virtuozzo.fo.xsl $<

%_build.xml: %.asc
	echo "\
	<project>\
	  <property name=\"xslt-processor-classpath\" value=\"$(SAXONPATH)\"/>\
	  <property name=\"xercesImpl.jar\" value=\"/usr/share/java/xerces-j2.jar\"/>\
	  <property name=\"xml-apis.jar\" value=\"/usr/share/java/xml-commons-apis.jar\"/>\
	  <property name=\"input-xml\" value=\"$(XML_DIR)/`echo $<|sed 's/\.asc/.xml/'`\"/>\
	  <property name=\"output-dir\" value=\"`echo $<|sed 's/\.asc/.webhelp/'`\"/>\
	  <property name=\"stylesheet-path\" value=\"stylesheets/virtuozzo.webhelp.xsl\"/>\
	  <import file=\"/usr/share/sgml/docbook/xsl-ns-stylesheets/webhelp/build.xml\"/>\
	</project>\
	" > $@

$(XML_DIR)/%.xml: %.asc
	mkdir -p xml
	a2x -vL -a docinfo1 -r images -f docbook -D $(XML_DIR)/ $<

%.webhelp: %_build.xml $(XML_DIR)/%.xml
	ant webhelp -buildfile $<
	cp stylesheets/virtuozzo.webhelp.stylesheet.css $@/common/css
	cp stylesheets/odin-logo-white.png $@/common/images
	rm $@/common/main.js
	cp stylesheets/main.js $@/common
	rm $@/favicon.ico
	cp stylesheets/favicon.ico $@/
	cp -r images/ $@


clean:
	rm -rvf $(XML_DIR)/* *.webhelp *.pdf *_build.xml xml/
