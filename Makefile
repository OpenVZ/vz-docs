ifndef SAXONPATH
  SAXONPATH = /usr/share/java/saxon.jar
endif

DOCBOOK_DIST := /usr/share/sgml/docbook/xsl-ns-stylesheets
USER_IMAGES_PARENT_DIR := images
THER_XSLTPROC_ARGS = --stringparam webhelp.base.dir "$(OUTPUT_DIR)"
INDEXER_EXCLUDED_FILES = ix01.html

#=================================================
# You probably don't need to change anything below
# unless you choose to add a validation step.
# ================================================
DOCBOOK_EXTENSIONS_DIR = $(DOCBOOK_DIST)/extensions
INDEXER_JAR   := $(DOCBOOK_EXTENSIONS_DIR)/webhelpindexer.jar
TAGSOUP_JAR   := $(DOCBOOK_EXTENSIONS_DIR)/tagsoup-1.2.1.jar
LUCENE_ANALYZER_JAR   := $(DOCBOOK_EXTENSIONS_DIR)/lucene-analyzers-3.0.0.jar
LUCENE_CORE_JAR   := $(DOCBOOK_EXTENSIONS_DIR)/lucene-core-3.0.0.jar

classpath := $(INDEXER_JAR):$(TAGSOUP_JAR):$(LUCENE_ANALYZER_JAR):$(LUCENE_CORE_JAR)


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

$(XML_DIR)/%.xml: %.asc
	mkdir -p xml
	a2x -vL -a docinfo1 -r images -f docbook -D $(XML_DIR)/ $<

%.webhelp: $(XML_DIR)/%.xml
	rm -rf $@
	mkdir -p $@
	cp -r $(DOCBOOK_DIST)/webhelp/template/common $@
	test ! -d $(USER_IMAGES_PARENT_DIR) || cp -r $(USER_IMAGES_PARENT_DIR) $@
	cp stylesheets/virtuozzo.webhelp.stylesheet.css $@/common/css
	cp stylesheets/odin-logo-white.png $@/common/images
	rm $@/common/main.js
	cp stylesheets/main.js $@/common
	cp stylesheets/favicon.ico $@
	xsltproc  --stringparam webhelp.base.dir $@ stylesheets/virtuozzo.webhelp.xsl $<
	java \
              -DhtmlDir=$@ \
              -DindexerLanguage=en \
              -DhtmlExtension=html \
              -DdoStem=true \
              -DindexerExcludedFiles=$(INDEXER_EXCLUDED_FILES) \
              -Dorg.xml.sax.driver=org.ccil.cowan.tagsoup.Parser \
              -Djavax.xml.parsers.SAXParserFactory=org.ccil.cowan.tagsoup.jaxp.SAXFactoryImpl \
              -classpath $(classpath) \
              com.nexwave.nquindexer.IndexerMain


clean:
	rm -rvf $(XML_DIR)/* *.webhelp *.pdf *_build.xml xml/
