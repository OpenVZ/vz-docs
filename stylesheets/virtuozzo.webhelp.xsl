<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="/usr/share/sgml/docbook/xsl-ns-stylesheets/webhelp/xsl/webhelp.xsl"/>
<xsl:import href="virtuozzo.webhelp.titlepages.xsl"/>

<xsl:param name="use.role.for.mediaobject">1</xsl:param>
<xsl:param name="preferred.mediaobject.role">webhelp</xsl:param>

<xsl:param name="chunker.output.method">xml</xsl:param>

<xsl:param name="shade.verbatim" select="0"/>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="border">0</xsl:attribute>
  <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="section.autolabel.max.depth">3</xsl:param>
<xsl:param name="admon.textlabel" select="1"/>
<xsl:param name="generate.legalnotice.link" select="0"/>
<xsl:param name="formal.object.break.after" select="0"/>
<xsl:param name="chapter.autolabel" select="1"/>
<xsl:param name="section.autolabel" select="1"/>

<xsl:param name="generate.toc">
book      nop
chapter   nop
</xsl:param>

    <xsl:template name="webhelpheader.logo">
	<a href="index.html">
	<img style='margin-right: 2px; margin-top: 6px; margin-left: 38px; height: 51px; padding-right: 25px; padding-top: 18px;' align="right"
	    src='{$webhelp.common.dir}images/openvz_logo_webhelp.png'/>
	</a>
    </xsl:template>

<!--<xsl:template name="webhelpheader"/>-->

    <!-- HTML <head> section customizations -->

    <xsl:template name="user.head.content">
        <xsl:param name="title">
                <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
        </xsl:param>
         <meta name="Section-title" content="{$title}"/>   

        <script type="text/javascript">
            //The id for tree cookie
            var treeCookieId = "<xsl:value-of select="$webhelp.tree.cookie.id"/>";
            var language = "<xsl:value-of select="$webhelp.indexer.language"/>";
            var w = new Object();
            //Localization
            txt_filesfound = '<xsl:call-template name="gentext.template">
                <xsl:with-param name="name" select="'txt_filesfound'"/>
		<xsl:with-param name="context" select="'webhelp'"/>
                </xsl:call-template>';
            txt_enter_at_least_1_char = "<xsl:call-template name="gentext.template">
                <xsl:with-param name="name" select="'txt_enter_at_least_1_char'"/>
		<xsl:with-param name="context" select="'webhelp'"/>
                </xsl:call-template>";
            txt_browser_not_supported = "<xsl:call-template name="gentext.template">
                <xsl:with-param name="name" select="'txt_browser_not_supported'"/>
		<xsl:with-param name="context" select="'webhelp'"/>
                </xsl:call-template>";
            txt_please_wait = "<xsl:call-template name="gentext.template">
                <xsl:with-param name="name" select="'txt_please_wait'"/>
		<xsl:with-param name="context" select="'webhelp'"/>
                </xsl:call-template>";
            txt_results_for = "<xsl:call-template name="gentext.template">
                <xsl:with-param name="name" select="'txt_results_for'"/>
		<xsl:with-param name="context" select="'webhelp'"/>
                </xsl:call-template>";
        </script>

	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="{$webhelp.common.dir}css/positioning.css"/>
        <link rel="stylesheet" type="text/css" href="{$webhelp.common.dir}jquery/theme-redmond/jquery-ui-1.8.2.custom.css"/>
        <link rel="stylesheet" type="text/css" href="{$webhelp.common.dir}jquery/treeview/jquery.treeview.css"/>
        <style type="text/css">

#noscript{
    font-weight:bold;
	background-color: #55AA55;
    font-weight: bold;
    height: 25spx;
    z-index: 3000;
	top:0px;
	width:100%;
	position: relative;
	border-bottom: solid 5px black;
	text-align:center;
	color: white;
}

input {
    margin-bottom: 5px;
    margin-top: 2px;
}
.folder {
    display: block;
    height: 22px;
    padding-left: 20px;
    background: transparent url(<xsl:value-of select="$webhelp.common.dir"/>jquery/treeview/images/folder.gif) 0 0px no-repeat;
}
span.contentsTab {
    padding-left: 20px;
    background: url(<xsl:value-of select="$webhelp.common.dir"/>images/toc-icon.png) no-repeat 0 center;
}
span.searchTab {
    padding-left: 20px;
    background: url(<xsl:value-of select="$webhelp.common.dir"/>images/search-icon.png) no-repeat 0 center;
}

/* Overide jquery treeview's defaults for ul. */
.treeview ul {
    background-color: transparent;
    margin-top: 4px;
}		

/*
#webhelp-currentid {
    font-weight: bold;
    background-color: #FFF !important;
}
.treeview .hover { color: #1B592A; } /*9D0C22*/
.filetree li span a { text-decoration: none; font-size: 12px; color: #517291; }
*/

/* Override jquery-ui's default css customizations. These are supposed to take precedence over those.*/
.ui-widget-content {
    border: 0px; 
    background: none; 
    color: none;     
}
.ui-widget-header {
    color: #e9e8e9;
    border-left: 1px solid #e5e5e5;
    border-right: 1px solid #e5e5e5;
    border-bottom: 1px solid #bbc4c5;
    border-top: 4px solid #e5e5e5;
    border: medium none;
    background: #F4F4F4; /* old browsers */
    background: -moz-linear-gradient(top, #F4F4F4 0%, #E6E4E5 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#F4F4F4), color-stop(100%,#E6E4E5)); /* webkit */    
    font-weight: none;
}
.ui-widget-header a { color: none; }
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default { 
border: none; background: none; font-weight: none; color: none; }
.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited { color: black; text-decoration: none; }
.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus { border: none; background: none; font-weight: none; color: none; }

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active { border: none; background: none; font-weight: none; color: none; }
.ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited { 
    color: black; text-decoration: none; 	
    background: #C6C6C6; /* old browsers */
    background: -moz-linear-gradient(top, #C6C6C6 0%, #D8D8D8 100%); /* firefox */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#C6C6C6), color-stop(100%,#D8D8D8)); /* webkit */
    -webkit-border-radius:15px; -moz-border-radius:10px;
    border: 1px solid #f1f1f1;
}    
.ui-corner-all { border-radius: 0 0 0 0; }

.ui-tabs { padding: .2em;}
.ui-tabs .ui-tabs-nav li { top: 0px; margin: -2px 0 1px; text-transform: uppercase; font-size: 10.5px;}
.ui-tabs .ui-tabs-nav li a { padding: .25em 2em .25em 1em; margin: .5em; text-shadow: 0 1px 0 rgba(255,255,255,.5); }
       /**
	 *	Basic Layout Theme
	 * 
	 *	This theme uses the default layout class-names for all classes
	 *	Add any 'custom class-names', from options: paneClass, resizerClass, togglerClass
	 */

	.ui-layout-pane { /* all 'panes' border: 1px solid #BBB; */ 
		background: #FFF; 
		padding: 05x; 
		overflow: auto;
	} 
        
	.ui-layout-resizer { /* all 'resizer-bars' */ 
		background: #DDD; 
                top:100px
	} 

	.ui-layout-toggler { /* all 'toggler-buttons' */ 
		background: #AAA; 
	} 
    
       </style>
        <xsl:comment><xsl:text>[if IE]>
	&lt;link rel="stylesheet" type="text/css" href="../common/css/ie.css"/>
	&lt;![endif]</xsl:text></xsl:comment>

	<script type="text/javascript" src="{$webhelp.common.dir}browserDetect.js">
            <xsl:comment> </xsl:comment>
	</script>
        <script type="text/javascript" src="{$webhelp.common.dir}jquery/jquery-1.7.2.min.js">
            <xsl:comment> </xsl:comment>
        </script>
        <script type="text/javascript" src="{$webhelp.common.dir}jquery/jquery.ui.all.js">
            <xsl:comment> </xsl:comment>
        </script>
        <script type="text/javascript" src="{$webhelp.common.dir}jquery/jquery.cookie.js">
            <xsl:comment> </xsl:comment>
        </script>
        <script type="text/javascript" src="{$webhelp.common.dir}jquery/treeview/jquery.treeview.min.js">
            <xsl:comment> </xsl:comment>
        </script>
         <script type="text/javascript" src="{$webhelp.common.dir}jquery/layout/jquery.layout.js">
            <xsl:comment> </xsl:comment>
        </script>
        <xsl:if test="$webhelp.include.search.tab != '0'">

            <script type="text/javascript" src="search/l10n.js">
	    <xsl:comment/>
	  </script>
      <script type="text/javascript" src="search/htmlFileInfoList.js">
	      <xsl:comment> </xsl:comment>
	  </script>
	  <script type="text/javascript" src="search/nwSearchFnt.js">
	      <xsl:comment> </xsl:comment>
	  </script>

	  <script type="text/javascript" src="{concat('search/stemmers/',$webhelp.indexer.language,'_stemmer.js')}">
	      <xsl:comment>//make this scalable to other languages as well.</xsl:comment>
	  </script>

	  <script type="text/javascript" src="search/index-1.js">
	      <xsl:comment> </xsl:comment>
	  </script>
	  <script type="text/javascript" src="search/index-2.js">
	      <xsl:comment> </xsl:comment>
	  </script>
	  <script type="text/javascript" src="search/index-3.js">
	      <xsl:comment> </xsl:comment>
	  </script>
	</xsl:if>

        <link rel="stylesheet" type="text/css" href="{$webhelp.common.dir}css/virtuozzo.webhelp.stylesheet.css"/>

        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-69551427-9', 'auto');
          ga('send', 'pageview');

        </script>

    </xsl:template>

	<!-- End of index files -->

</xsl:stylesheet>

