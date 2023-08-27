
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="products">
    <html>
      <head>
        <title>Product Catalog</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <style>
          table, th, td {
            border: 1px solid white;
            border-collapse: collapse;
          }
          th, td {
            background-color: yellow;
          }
          </style>
      </head>
      <body>
        <h1>Product Catalog</h1>
        <table style="width:100%">
          <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Category</th>
          </tr>
          <xsl:apply-templates select="product">
            <xsl:sort select="name" data-type="text" order="ascending"/>
          </xsl:apply-templates>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="product">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td>$<xsl:value-of select="format-number(price, '###0.00')"/></td>
      <td><xsl:value-of select="quantity"/></td>
      <td><xsl:value-of select="category"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
