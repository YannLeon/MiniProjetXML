<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8"/>


    <xsl:template match="/">
        <xsl:element name="clients">
        <xsl:apply-templates select="compagnie/contrats/contrat"/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="contrat">
        <xsl:variable name="op" select="options" />
        <xsl:variable name="cl" select="idClient" />
        <xsl:if test="not(contains($op, ','))">
            <xsl:element name="client">
                <xsl:element name="Nom">
                    <xsl:value-of select="/compagnie/clients/client[@id=$cl]/nom"/>
                </xsl:element>
                <xsl:element name="Prenom">
                    <xsl:value-of select="/compagnie/clients/client[@id=$cl]/prenom"/>
                </xsl:element>
                <xsl:element name="telephone">
                    <xsl:value-of select="/compagnie/clients/client[@id=$cl]/telephone"/>
                </xsl:element>

            </xsl:element>
        </xsl:if>
    </xsl:template>



</xsl:stylesheet>