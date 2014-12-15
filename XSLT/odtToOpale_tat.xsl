<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
      xpath-default-namespace="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
      exclude-result-prefixes="xs"
      version="2.0">
      <xsl:output method="xml" indent="yes"></xsl:output>
     
      <xsl:template match="/">
            <sc:item xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
                  <op:cloze xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:op="utc.fr:ics/opale3">            
                        <op:exeM/>
                        <sc:gapText>
                              <op:clozeTxt>
                                    <sc:para xml:space="preserve">
                                          <xsl:call-template name="getSections"></xsl:call-template>
                                    </sc:para>
                              </op:clozeTxt>
                        </sc:gapText>
                  </op:cloze>
            </sc:item>
      </xsl:template>
      
      <xsl:template name="getSections" xpath-default-namespace="urn:oasis:names:tc:opendocument:xmlns:text:1.0">
            <xsl:for-each select="//section[@text:name='travail']">
                  <xsl:for-each select=".//p">
                        <xsl:call-template name="detectS"></xsl:call-template>
                        ------------------------------------------ 
                  </xsl:for-each>
            </xsl:for-each>
      </xsl:template>
      
      <xsl:template match="p" name="detectS">
            <xsl:if test="string-length(.) != 0">
                  <xsl:text>&#xa;</xsl:text>
                  <xsl:apply-templates select="."></xsl:apply-templates>
            </xsl:if>
      </xsl:template>
      
      <xsl:template match="s" xpath-default-namespace="urn:oasis:names:tc:opendocument:xmlns:text:1.0">
            <xsl:call-template name="getAnswers" ></xsl:call-template>
            <sc:textLeaft xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" role="gap">
                  <xsl:variable name="idControl"><xsl:value-of select="./following-sibling::*[1]/@draw:control" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"></xsl:value-of></xsl:variable>
                  <xsl:value-of select="//form:text[@form:id=$idControl]/@form:title" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"></xsl:value-of>
            </sc:textLeaft>
      </xsl:template>
      
      <xsl:template name="getAnswers">
            
      </xsl:template>
      
</xsl:stylesheet>
