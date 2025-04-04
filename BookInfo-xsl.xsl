<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>BookInfo</title>
</head>
<body>
<h2>Book Info</h2>
<table border="1">
<tr bgcolor="#3cb371">
<th>ISBN</th>
<th>BookName</th>
<th>Price</th>
<th>Author</th>
<th>Genre</th>
<th></th>
</tr>
<xsl:for-each select="catalog/cd">
<tr>
<td><xsl:value-of select="ISBN"/></td>
<td><xsl:value-of select="BookName"/></td>
<td><xsl:value-of select="Price"/></td>
<td><xsl:value-of select="Author"/></td>
<td><xsl:value-of select="Genre"/></td>
</tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet> 