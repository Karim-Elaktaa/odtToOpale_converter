<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"

      exclude-result-prefixes="xs" version="2.0">
      <xsl:output method="xml" indent="yes"/>

      <xsl:template match="/">
            <sc:item xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
                  <op:cloze xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive"
                        xmlns:op="utc.fr:ics/opale3">
                        <op:exeM/>
                        <sc:gapText>
                              <op:clozeTxt>
                                    <xsl:call-template name="getSections"/>
                              </op:clozeTxt>
                        </sc:gapText>
                  </op:cloze>
            </sc:item>
      </xsl:template>

      <xsl:template name="getSections"
            xpath-default-namespace="urn:oasis:names:tc:opendocument:xmlns:text:1.0">
            <xsl:for-each select="//section[@text:name='travail']">
                  <xsl:for-each select=".//p">
                        <xsl:call-template name="detectS"/>
                  </xsl:for-each>
            </xsl:for-each>
      </xsl:template>

      <xsl:template match="p" name="detectS">
            <xsl:if test="string-length(.) > 0">
                  <sc:para xml:space="preserve" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
                        <xsl:apply-templates select="."/>
                  </sc:para>
            </xsl:if>
      </xsl:template>

      <xsl:template match="s"
            xpath-default-namespace="urn:oasis:names:tc:opendocument:xmlns:text:1.0">
            <sc:textLeaf xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" role="gap">
                  <xsl:variable name="idControl">
                        <xsl:value-of select="./following-sibling::*[1]/@draw:control"
                              xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"/>
                  </xsl:variable>
                  <xsl:value-of select="//form:text[@form:id=$idControl]/@form:title"
                        xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
                        xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"/>
            </sc:textLeaf>
      </xsl:template>

</xsl:stylesheet>
