<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="elementoRaiz" select="name(/*)" />

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="$elementoRaiz"/></title>
                <link rel="stylesheet" href="css/ite.css"/>
            </head>
            <body>
                <h1><xsl:value-of select="$elementoRaiz"/></h1>
                <h2>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="/ite/@web" />
                        </xsl:attribute>
                        <xsl:value-of select="/ite/@nombre"/>
                    </a>
                </h2>
                
                <h2>Empresa: PROEDUCA</h2>
                <h2>TELÉFONO: 
                    <xsl:value-of select="//telefono"/></h2>

                <div id="tabla_profesores">
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                        </tr>
                        <xsl:for-each select="ite/profesores/profesor">
                            <tr>
                                <td><xsl:value-of select="id"/></td>     
                                <td><xsl:value-of select="nombre"/></td>                        
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                
                <div id="tabla_ciclos">
                    <table>
                        <tr>
                            <th>Código</th>
                            <th>Ciclo</th>
                            <th>Grado</th>
                            <th>Decreto</th>
                        </tr>
                        <xsl:for-each select="ite/ciclos/ciclo">
                            <tr> 
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="grado"/></td>
                                <td><xsl:value-of select="decretoTitulo/@ano"/></td>                     
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>

                <h3><xsl:value-of select="name(ite/director)"/></h3>
                <div>
                    <ul>
                        <li><xsl:value-of select="//director/nombre"/></li>
                        <li><xsl:value-of select="//director/despacho"/></li>
                    </ul>
                </div>
                

                <h3><xsl:value-of select="name(ite/jefe_estudios)"/></h3>
                <div>
                    <ul>
                        <li><xsl:value-of select="//jefe_estudios/nombre"/></li>
                        <li><xsl:value-of select="//jefe_estudios/despacho"/></li>
                    </ul>
                </div>

                
                <form class="estilo_form">
                    <h3>CONTACTO</h3>
                    <div>
                        <label for="fc_nombre">Nombre: </label>
                        <input type="text" id="fc_nombre" name="fc_nombre"></input>
                    </div>
                    
                    <div>
                        <label for="fc_apellido">Apellido: </label>
                        <input type="text" id="fc_apellido" name="fc_apellido"></input>
                    </div>
                    
                    <div>
                        <label for="fc_telefono">Teléfono: </label>
                        <input type="tel" id="fc_telefono" name="fc_telefono" pattern="[0-9]{3} [0-9]{9} [0-9]{3}"></input>
                    </div>
                    
                    <div>
                        <label for="fc_email">E-mail: </label>
                        <input type="email" id="fc_email" name="fc_email"></input>
                    </div>
                    
                    <div>
                        <label for="contacto">Contactar con:</label>
                        <select id="contacto" name="contacto">
                            <option>
                                <xsl:value-of select="//director/nombre"/> - <xsl:value-of select="name(ite/director)"/>
                            </option>
                            <option>
                                <xsl:value-of select="//jefe_estudios/nombre"/> - <xsl:value-of select="name(ite/jefe_estudios)"/>
                            </option>
                            <xsl:for-each select="ite/profesores/profesor"> 
                                <option><xsl:value-of select="nombre"/> - <xsl:value-of select="name(.)"/></option>                        
                            </xsl:for-each>
                        </select>
                    </div>
                    
                    <div>
                        <input type="submit" value="Enviar"></input>
                    </div>
                </form>

                



            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>