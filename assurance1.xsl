<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Liste des options triées par ordre de prix croissant</h2>
                <xsl:apply-templates select="compagnie/options/option">
                    <xsl:sort select="prix" data-type="number"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="option">
        <p>
            <xsl:apply-templates select="nom"/>
            <xsl:apply-templates select="prix"/>
        </p>
    </xsl:template>

    <xsl:template match="nom">
        <span style="color:#280400"> <xsl:value-of select="."/></span> :
    </xsl:template>

    <xsl:template match="prix">
        <span style="color:#280400"> <xsl:value-of select="."/></span> €
        <br/>
    </xsl:template>
</xsl:stylesheet>
