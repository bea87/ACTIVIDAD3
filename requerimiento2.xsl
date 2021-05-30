<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
      <ite>
        <!-- nombre pasa de ser atributo a ser elemento hijo de ite -->
        <name>
            <xsl:value-of select="/ite/@nombre" />
        </name>
        <!-- web pasa de ser atributo a ser elemento hijo de ite -->
        <web>
            <xsl:value-of select="/ite/@web" />
        </web>

        <!-- empresa pasa de ser elemento a ser atributo de ite -->
        <xsl:attribute name="firma">
            <xsl:value-of select="/ite/empresa" />
        </xsl:attribute>
        <!-- telefono pasa de ser elemento a ser atributo de ite -->
        <xsl:attribute name="telefono">
            <xsl:value-of select="/ite/telefono" />
        </xsl:attribute>

        <!-- Reorganizar la etiqueta director -> jefe y sus elementos hijos pasan a ser atributos -->
        <jefe>
            <xsl:attribute name="nombre">
                <xsl:value-of select="ite/director/nombre" />
            </xsl:attribute>
            <xsl:attribute name="despacho">
                <xsl:value-of select="ite/director/despacho" />
            </xsl:attribute>
        </jefe>

        <!-- Reorganizar la etiqueta jefe_estudios. Sus elementos hijos pasan a ser atributos -->
        <jefe_estudios>
            <xsl:attribute name="nombre">
                <xsl:value-of select="ite/jefe_estudios/nombre" />
            </xsl:attribute>
            <xsl:attribute name="despacho">
                <xsl:value-of select="ite/jefe_estudios/despacho" />
            </xsl:attribute>
        </jefe_estudios>
        
        <!-- Reorganizar los elementos ciclo con un bucle for-each
        Para cada una: los elementos nombre y grado pasan a ser atributos.
        el atribudo ID pasa a ser elemento -->
        <ciclos_formativos>
            <xsl:for-each select="ite/ciclos/ciclo">
                <ciclo>
                    <xsl:attribute name="nombre">
                        <xsl:value-of select="nombre" />
                    </xsl:attribute>
                    <xsl:attribute name="grado">
                        <xsl:value-of select="grado" />
                    </xsl:attribute>
                    <id><xsl:value-of select="@id" /></id>
                    <anioTitulo><xsl:value-of select="decretoTitulo/@ano" /></anioTitulo>
                </ciclo>
            </xsl:for-each>
        </ciclos_formativos>

        <!-- Reorganziamos el elemento profesores. Ahora se llama docentes
        Con un bucle for-each recorremos su contenido y modificamos sus hijos (profesore)
        que pasan a llamarse docente. El elemento hijo ID pasa a ser atributo -->
        <docentes>
            <xsl:for-each select="ite/profesores/profesor">
                <docente>
                    <xsl:attribute name="id">
                        <xsl:value-of select="id" />
                    </xsl:attribute>
                    <xsl:value-of select="nombre" />
                </docente>
            </xsl:for-each>
        </docentes>
    </ite>
    </xsl:template>
</xsl:stylesheet>