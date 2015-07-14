<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>
<xsl:import href="/usr/share/asciidoc/docbook-xsl/fo.xsl"/>
<xsl:import href="virtuozzo.fo.titlepages.xsl"/>

<xsl:param name="paper.type" select="'USletter'"/>
<xsl:param name="alignment">left</xsl:param>

<xsl:param name="body.font.family" select="'serif'"/>
<xsl:param name="body.font.master">12</xsl:param>
<xsl:param name="body.font.size">
 <xsl:value-of select="$body.font.master"/><xsl:text>pt</xsl:text>
</xsl:param>

<xsl:attribute-set name="monospace.properties">
  <xsl:attribute name="font-size">10pt</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="insert.xref.page.number" select="1"/>
<xsl:param name="admon.textlabel" select="1"/>
<xsl:param name="formal.object.break.after">0</xsl:param>

<xsl:param name="double.sided" select="1"/>
<xsl:template name="initial.page.number">auto</xsl:template>
<xsl:template name="page.number.format">1</xsl:template>
<xsl:template name="force.page.count">no-force</xsl:template>

<!--
  Table of contents inserted by <?asciidoc-toc?> processing instruction.
-->
<xsl:param name="generate.toc">
   <xsl:choose>
      <xsl:when test="/processing-instruction('asciidoc-toc')">
book    toc,title
      <!-- The only way I could find that suppressed book chapter TOCs -->
         <xsl:if test="$generate.section.toc.level != 0">
chapter   toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
         </xsl:if>
      </xsl:when>
      <xsl:otherwise>
book    nop
      </xsl:otherwise>
   </xsl:choose>
</xsl:param>

<!-- Only shade programlisting and screen verbatim elements -->
<xsl:param name="shade.verbatim" select="1"/>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="padding">3pt</xsl:attribute>
  <xsl:attribute name="margin-left">0.75pt</xsl:attribute>
  <xsl:attribute name="margin-right">0.75pt</xsl:attribute>
  <xsl:attribute name="background-color">
    <xsl:choose>
      <xsl:when test="self::programlisting|self::screen">#E0E0E0</xsl:when>
      <xsl:otherwise>inherit</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:param name="table.borders.with.css" select="1"/>
<xsl:param name="table.cell.border.color" select="'#C0C0C0'"/>
<xsl:param name="table.cell.border.style" select="'solid'"/>
<xsl:param name="table.cell.border.thickness" select="'1px'"/>
<xsl:param name="table.footnote.number.format" select="'a'"/>
<xsl:param name="table.footnote.number.symbols" select="''"/>
<xsl:param name="table.frame.border.color" select="'#C0C0C0'"/>
<xsl:param name="table.frame.border.style" select="'solid'"/>
<xsl:param name="table.frame.border.thickness" select="'1px'"/>
<xsl:param name="tablecolumns.extension" select="'1'"/>

<xsl:template name="table.cell.properties">
  <xsl:choose>
    <xsl:when test="ancestor::thead">
      <xsl:attribute name="background-color">#C0C0C0</xsl:attribute>
      <xsl:attribute name="border">#C0C0C0 0.75pt solid</xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:attribute name="background-color">#FFFFFF</xsl:attribute>
      <xsl:attribute name="border">#C0C0C0 0.75pt solid</xsl:attribute>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Header -->
<xsl:param name="header.column.widths">8 1 1</xsl:param>

<xsl:template name="header.content">  
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <fo:block>  
    <xsl:attribute name="color">#67151E</xsl:attribute>
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$pageclass = 'body' and $sequence = 'first' and $position = 'left'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'first' and $position = 'right'"></xsl:when>  
      <xsl:when test="$pageclass = 'body' and $sequence = 'first' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'odd' and $position = 'left'">  
        <xsl:apply-templates select="." mode="object.title.markup"/>
      </xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'odd' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'odd' and $position = 'right'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'even' and $position = 'left'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'even' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'even' and $position = 'right'">
        <xsl:apply-templates select="." mode="object.title.markup"/>
      </xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'blank' and $position = 'left'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'blank' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'blank' and $position = 'right'"></xsl:when>
    </xsl:choose>
  </fo:block>
</xsl:template>

<xsl:template name="head.sep.rule">
  <xsl:param name="pageclass"/>
  <xsl:param name="sequence"/>
  <xsl:param name="gentext-key"/>
  <xsl:if test="$header.rule != 0">
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage'"></xsl:when>
      <xsl:when test="$pageclass = 'lot'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'first'">
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="border-bottom">0.5pt solid #67151E</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>
<!-- Header -->

<!-- Footer -->
<xsl:template name="footer.content">  
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <fo:block>  
    <xsl:attribute name="color">#807F83</xsl:attribute>
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$pageclass = 'body' and $sequence = 'first' and $position = 'left'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'first' and $position = 'right'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'first' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'odd' and $position = 'left'">  
        <fo:page-number/>
      </xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'odd' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'odd' and $position = 'right'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'even' and $position = 'left'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'even' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'even' and $position = 'right'">
        <fo:page-number/>
      </xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'blank' and $position = 'left'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'blank' and $position = 'center'"></xsl:when>
      <xsl:when test="$pageclass = 'body' and $sequence = 'blank' and $position = 'right'"></xsl:when>
    </xsl:choose>
  </fo:block>
</xsl:template>
<!-- Footer -->

<!-- Note block style -->
<xsl:attribute-set name="nongraphical.admonition.properties">
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.start}">0.0in</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.end}">0.0in</xsl:attribute>
  <xsl:attribute name="border-top">1pt solid #368FAF</xsl:attribute>
  <xsl:attribute name="border-bottom">1pt solid #368FAF</xsl:attribute>
  <xsl:attribute name="padding-left">4pt</xsl:attribute>
  <xsl:attribute name="padding-right">4pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
  <xsl:attribute name="background-color">#F5F5F5</xsl:attribute>
  <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
</xsl:attribute-set>

<!-- Note title style -->
<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="font-size">0pt</xsl:attribute>
  <xsl:attribute name="margin">0in</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="border">0pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">-8pt</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="footer.rule" select="0"/>

<!-- Custom gentexts -->
<xsl:param name="local.l10n.xml" select="document('')"/>
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
  <l:l10n language="en">
    <l:gentext key="Note" text=""/>
    <l:gentext key="pubdate" text=""/>
    <l:context name="xref">
      <l:template name="page.citation" text=" (p. %p)"/>
    </l:context>
  </l:l10n>
</l:i18n>

<!-- URL, cross-reference style -->
<xsl:attribute-set name="xref.properties">
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="color">
    <xsl:choose>
      <xsl:when test="self::ulink">blue</xsl:when>
      <xsl:when test="self::xref">#9D0C22</xsl:when>
      <xsl:otherwise>inherit</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!-- Page numbers style -->
<xsl:template match="*" mode="page.citation">
  <xsl:param name="id" select="'???'"/>
  <fo:basic-link internal-destination="{$id}"
                 xsl:use-attribute-sets="xref.properties">
    <fo:inline keep-together.within-line="always"
               font-weight="normal">
      <xsl:call-template name="substitute-markup">
        <xsl:with-param name="template">
          <xsl:call-template name="gentext.template">
            <xsl:with-param name="name" select="'page.citation'"/>
            <xsl:with-param name="context" select="'xref'"/>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </fo:inline>
  </fo:basic-link>
</xsl:template>

<!-- Chapter title style -->
<xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">  
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" 
            xsl:use-attribute-sets="chapter.titlepage.recto.style" 
            margin-left="{$title.margin.left}" 
            font-size="24.8832pt"
            font-weight="normal" 
            font-family="serif"
            color="#9D0C22">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor-or-self::chapter[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- Section title style -->
<xsl:template match="title" mode="section.titlepage.recto.auto.mode">  
  <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" 
            xsl:use-attribute-sets="section.titlepage.recto.style" 
            margin-left="{$title.margin.left}" 
            margin-top="20pt"
            font-size="20.736pt"
            font-weight="normal" 
            font-family="serif"
            color="#9D0C22">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor-or-self::section[1]"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- Table title style -->
<xsl:attribute-set name="formal.title.properties">
  <xsl:attribute name="font-size">
     <xsl:value-of select="$body.font.master"/><xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
