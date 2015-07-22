<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook"
xmlns:exsl="http://exslt.org/common" version="1.0" exclude-result-prefixes="exsl d">

<!-- This stylesheet was created by template/titlepage.xsl-->

<xsl:template name="book.titlepage.recto">

<!--  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:mediaobject"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:mediaobject"/>

  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>-->

  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:pubdate"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:legalnotice"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
</xsl:template>

<xsl:template name="book.titlepage.verso">
</xsl:template>

<xsl:template name="book.titlepage.separator">
<!--<hr/>-->
</xsl:template>

<xsl:template name="book.titlepage.before.recto">
</xsl:template>

<xsl:template name="book.titlepage.before.verso">
</xsl:template>

<xsl:template name="book.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="book.titlepage.before.recto"/>
      <xsl:call-template name="book.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="book.titlepage.before.verso"/>
      <xsl:call-template name="book.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="book.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="book.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="book.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:mediaobject" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:legalnotice" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:pubdate" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="chapter.titlepage.recto">
<!--  <xsl:choose>
    <xsl:when test="d:chapterinfo/d:title">
      <xsl:apply-templates mode="chapter.titlepage.recto.auto.mode" select="d:chapterinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:title">
      <xsl:apply-templates mode="chapter.titlepage.recto.auto.mode" select="d:docinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="chapter.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="chapter.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
-->
</xsl:template>

<xsl:template name="chapter.titlepage.verso">
</xsl:template>

<xsl:template name="chapter.titlepage.separator">
</xsl:template>

<xsl:template name="chapter.titlepage.before.recto">
</xsl:template>

<xsl:template name="chapter.titlepage.before.verso">
</xsl:template>

<xsl:template name="chapter.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="chapter.titlepage.before.recto"/>
      <xsl:call-template name="chapter.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="chapter.titlepage.before.verso"/>
      <xsl:call-template name="chapter.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="chapter.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="chapter.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="chapter.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="chapter.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="chapter.titlepage.recto.style">
<xsl:apply-templates select="." mode="chapter.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="topic.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:topicinfo/d:title">
      <xsl:apply-templates mode="topic.titlepage.recto.auto.mode" select="d:topicinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="topic.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="topic.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="topic.titlepage.verso">
</xsl:template>

<xsl:template name="topic.titlepage.separator">
</xsl:template>

<xsl:template name="topic.titlepage.before.recto">
</xsl:template>

<xsl:template name="topic.titlepage.before.verso">
</xsl:template>

<xsl:template name="topic.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="topic.titlepage.before.recto"/>
      <xsl:call-template name="topic.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="topic.titlepage.before.verso"/>
      <xsl:call-template name="topic.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="topic.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="topic.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="topic.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="topic.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="topic.titlepage.recto.style">
<xsl:apply-templates select="." mode="topic.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="section.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:sectioninfo/d:title">
      <xsl:apply-templates mode="section.titlepage.recto.auto.mode" select="d:sectioninfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="section.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="section.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="section.titlepage.verso">
</xsl:template>

<xsl:template name="section.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="section.titlepage.before.recto">
</xsl:template>

<xsl:template name="section.titlepage.before.verso">
</xsl:template>

<xsl:template name="section.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="section.titlepage.before.recto"/>
      <xsl:call-template name="section.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="section.titlepage.before.verso"/>
      <xsl:call-template name="section.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="section.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="section.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="section.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="section.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="section.titlepage.recto.style">
<xsl:apply-templates select="." mode="section.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="sect1.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:sect1info/d:title">
      <xsl:apply-templates mode="sect1.titlepage.recto.auto.mode" select="d:sect1info/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="sect1.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="sect1.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="sect1.titlepage.verso">
</xsl:template>

<xsl:template name="sect1.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="sect1.titlepage.before.recto">
</xsl:template>

<xsl:template name="sect1.titlepage.before.verso">
</xsl:template>

<xsl:template name="sect1.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="sect1.titlepage.before.recto"/>
      <xsl:call-template name="sect1.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="sect1.titlepage.before.verso"/>
      <xsl:call-template name="sect1.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="sect1.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="sect1.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="sect1.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="sect1.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="sect1.titlepage.recto.style">
<xsl:apply-templates select="." mode="sect1.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="sect2.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:sect2info/d:title">
      <xsl:apply-templates mode="sect2.titlepage.recto.auto.mode" select="d:sect2info/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="sect2.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="sect2.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="sect2.titlepage.verso">
</xsl:template>

<xsl:template name="sect2.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="sect2.titlepage.before.recto">
</xsl:template>

<xsl:template name="sect2.titlepage.before.verso">
</xsl:template>

<xsl:template name="sect2.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="sect2.titlepage.before.recto"/>
      <xsl:call-template name="sect2.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="sect2.titlepage.before.verso"/>
      <xsl:call-template name="sect2.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="sect2.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="sect2.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="sect2.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="sect2.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="sect2.titlepage.recto.style">
<xsl:apply-templates select="." mode="sect2.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="sect3.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:sect3info/d:title">
      <xsl:apply-templates mode="sect3.titlepage.recto.auto.mode" select="d:sect3info/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="sect3.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="sect3.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="sect3.titlepage.verso">
</xsl:template>

<xsl:template name="sect3.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="sect3.titlepage.before.recto">
</xsl:template>

<xsl:template name="sect3.titlepage.before.verso">
</xsl:template>

<xsl:template name="sect3.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="sect3.titlepage.before.recto"/>
      <xsl:call-template name="sect3.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="sect3.titlepage.before.verso"/>
      <xsl:call-template name="sect3.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="sect3.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="sect3.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="sect3.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="sect3.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="sect3.titlepage.recto.style">
<xsl:apply-templates select="." mode="sect3.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="sect4.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:sect4info/d:title">
      <xsl:apply-templates mode="sect4.titlepage.recto.auto.mode" select="d:sect4info/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="sect4.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="sect4.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="sect4.titlepage.verso">
</xsl:template>

<xsl:template name="sect4.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="sect4.titlepage.before.recto">
</xsl:template>

<xsl:template name="sect4.titlepage.before.verso">
</xsl:template>

<xsl:template name="sect4.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="sect4.titlepage.before.recto"/>
      <xsl:call-template name="sect4.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="sect4.titlepage.before.verso"/>
      <xsl:call-template name="sect4.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="sect4.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="sect4.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="sect4.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="sect4.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="sect4.titlepage.recto.style">
<xsl:apply-templates select="." mode="sect4.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="sect5.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:sect5info/d:title">
      <xsl:apply-templates mode="sect5.titlepage.recto.auto.mode" select="d:sect5info/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="sect5.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="sect5.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="sect5.titlepage.verso">
</xsl:template>

<xsl:template name="sect5.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="sect5.titlepage.before.recto">
</xsl:template>

<xsl:template name="sect5.titlepage.before.verso">
</xsl:template>

<xsl:template name="sect5.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="sect5.titlepage.before.recto"/>
      <xsl:call-template name="sect5.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="sect5.titlepage.before.verso"/>
      <xsl:call-template name="sect5.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="sect5.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="sect5.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="sect5.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="sect5.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="sect5.titlepage.recto.style">
<xsl:apply-templates select="." mode="sect5.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="simplesect.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:simplesectinfo/d:title">
      <xsl:apply-templates mode="simplesect.titlepage.recto.auto.mode" select="d:simplesectinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:title">
      <xsl:apply-templates mode="simplesect.titlepage.recto.auto.mode" select="d:docinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="simplesect.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="simplesect.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="simplesect.titlepage.verso">
</xsl:template>

<xsl:template name="simplesect.titlepage.separator"><xsl:if test="count(parent::*)='0'"><hr/></xsl:if>
</xsl:template>

<xsl:template name="simplesect.titlepage.before.recto">
</xsl:template>

<xsl:template name="simplesect.titlepage.before.verso">
</xsl:template>

<xsl:template name="simplesect.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="simplesect.titlepage.before.recto"/>
      <xsl:call-template name="simplesect.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="simplesect.titlepage.before.verso"/>
      <xsl:call-template name="simplesect.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="simplesect.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="simplesect.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="simplesect.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="simplesect.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="simplesect.titlepage.recto.style">
<xsl:apply-templates select="." mode="simplesect.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="index.titlepage.recto">
  <div xsl:use-attribute-sets="index.titlepage.recto.style">
<xsl:call-template name="component.title">
<xsl:with-param name="node" select="ancestor-or-self::d:index[1]"/>
</xsl:call-template></div>
  <xsl:choose>
    <xsl:when test="d:indexinfo/d:subtitle">
      <xsl:apply-templates mode="index.titlepage.recto.auto.mode" select="d:indexinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:subtitle">
      <xsl:apply-templates mode="index.titlepage.recto.auto.mode" select="d:docinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="index.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="index.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

</xsl:template>

<xsl:template name="index.titlepage.verso">
</xsl:template>

<xsl:template name="index.titlepage.separator">
</xsl:template>

<xsl:template name="index.titlepage.before.recto">
</xsl:template>

<xsl:template name="index.titlepage.before.verso">
</xsl:template>

<xsl:template name="index.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="index.titlepage.before.recto"/>
      <xsl:call-template name="index.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="index.titlepage.before.verso"/>
      <xsl:call-template name="index.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="index.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="index.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="index.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:subtitle" mode="index.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="index.titlepage.recto.style">
<xsl:apply-templates select="." mode="index.titlepage.recto.mode"/>
</div>
</xsl:template>

</xsl:stylesheet>

