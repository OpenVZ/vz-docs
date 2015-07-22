#!/bin/bash
a2x -vL -a docinfo1 -r images -f docbook $1.asc
rm -f build.xml
cat <<_EOF_ >build.xml
<project>
  <property name="xslt-processor-classpath" value="saxon6-5-5/saxon.jar"/>
  <property name="xercesImpl.jar" value="xerces-2_11_0/xercesImpl.jar"/>
  <property name="xml-apis.jar" value="xerces-2_11_0/xml-apis.jar"/>
  <property name="input-xml" value="$1.xml"/>
  <property name="output-dir" value="$1.webhelp"/>
  <property name="stylesheet-path" value="stylesheets/virtuozzo.webhelp.xsl"/>
  <import file="/usr/share/sgml/docbook/xsl-ns-stylesheets/webhelp/build.xml"/>
</project>
_EOF_
ant webhelp
rm $1.xml
cp stylesheets/virtuozzo.webhelp.stylesheet.css $1.webhelp/common/css
#cp stylesheets/Odin_Virtuozzo_logo_webhelp.png $1.webhelp/common/images
cp stylesheets/odin-logo-white.png $1.webhelp/common/images
rm $1.webhelp/common/main.js
cp stylesheets/main.js $1.webhelp/common
rm $1.webhelp/favicon.ico
cp stylesheets/favicon.ico $1.webhelp/

