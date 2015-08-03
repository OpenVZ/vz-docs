## Virtuozzo documentation

This repository contains source files for Virtuozzo documentation.

Documentation is available online at http://docs.openvz.org.

### How to build

1. Install [AsciiDoc](http://www.methods.co.nz/asciidoc/).
2. Install [xsltproc](http://xmlsoft.org/XSLT/).
3. Install [Docbook XSL Stylesheets v4.x and v5.0](http://docbook.sourceforge.net/).
4. Install [Apache FOP](https://xmlgraphics.apache.org/fop/).
5. Install [Apache Xerces2 Java](http://xerces.apache.org/xerces2-j/).
6. Run make(1).

On CentOS:

 yum install -y asciidoc fop docbook5-style-xsl-extensions \
	docbook5-style-xsl xerces-j2 docbook5-schemas

### How to contribute

* [How to submit patches](https://openvz.org/Userspace_patches)
* Spread the word about OpenVZ in [social networks](https://openvz.org/Contacts)
