<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:book="http://KlementinumLibrary.com/XML">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Klementinum Library | Book Catalogue</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        padding: 40px;
                        background-color: #f5f5f5;
                    }
                    h2 {
                        color: #4a2c2a;
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        margin-bottom: 40px;
                    }
                    th, td {
                        border: 1px solid #ccc;
                        padding: 12px;
                        text-align: left;
                    }
                    th {
                        background-color: #a08063;
                    }
                    img {
                        max-height: 100px;
                        display: block;
                    }
                </style>
            </head>
            <body>
                <xsl:for-each select="bookstore/book:genre">
                    <h2><xsl:value-of select="@name"/></h2>
                    <p><xsl:value-of select="book:description"/></p>
                    <table>
                        <tr>
                            <th>Cover</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Genre</th>
                            <th>Price</th>
                            <th>Description</th>
                        </tr>

                        <xsl:for-each select="book:item">
                            <tr>
                                <td>
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="book:cover"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="book:title"/>
                                        </xsl:attribute>
                                    </img>
                                </td>
                                <td>
                                    <a>
                                        <xsl:value-of select="book:title"/>
                                    </a>
                                </td>
                                <td><xsl:value-of select="book:author"/></td>
                                <td><xsl:value-of select="book:category"/></td>
                                <td><xsl:value-of select="book:price"/></td>
                                <td><xsl:value-of select="book:summary"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>