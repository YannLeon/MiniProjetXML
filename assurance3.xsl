<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Liste de rentabilité des conseillers</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Conseiller</th>
                        <th>Salaire</th>
                        <th>Prix total des contrats signés</th>
                        <th>difference</th>
                    </tr>
                    <xsl:apply-templates select="compagnie/conseillers/conseiller">
                        <xsl:sort select="idConseiller"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="contrat">
        <tr>
            <td><xsl:apply-templates select="idConseiller" /></td>
            <td><xsl:apply-templates select="prix" /></td>
        </tr>
    </xsl:template>

    <xsl:template match="conseiller">
        <tr>
            <td><span style="color:#280400" > <xsl:value-of select="prenom"/><br></br> <xsl:value-of select="nom"/></span></td>
            <td><span style="color:#280400"><xsl:value-of select="salaire"/></span> </td>
            <xsl:variable name="idc" select="@id"/>
            <xsl:variable name="sal" select="salaire"/>
            <td><span style="color:#280400"> <xsl:value-of select="sum(/compagnie/contrats/contrat[idConseiller=$idc]/prix)"/></span></td>
            <td><span style="color:#280400"> <xsl:value-of select="sum(/compagnie/contrats/contrat[idConseiller=$idc]/prix)-$sal"/></span></td>
        </tr>
    </xsl:template>

    <xsl:template match="nom">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="prix">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="idConseiller">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="prenom">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="salaire">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>
</xsl:stylesheet>
