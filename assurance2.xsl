<?xml version="1.0" encoding="UTF-8"?>
<!--Cette feuille de transformation permet d’afficher uniquement les conseillers
de la compagnie payés plus de 30 000€ par an-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Liste des conseillers payés plus de 30 000 € triés par nom</h2>
                <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Nom</th>
                    <th>Prenom</th>
                    <th>Salaire</th>
                </tr>
                    <xsl:apply-templates select="compagnie/conseillers/conseiller">
                        <xsl:sort select="nom"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="conseiller">
        <xsl:if test="salaire &gt; 30000">
            <tr>
                <td><xsl:apply-templates select="nom"/></td>
                <td><xsl:apply-templates select="prenom"/></td>
                <td><xsl:apply-templates select="salaire"/></td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template match="nom">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="prenom">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="salaire">
        <span style="color:#280400"> <xsl:value-of select="."/></span>
    </xsl:template>
</xsl:stylesheet>
