<?xml version="1.0" encoding="UTF-8"?>
<!--
  ================================================
  CD Catalog — catalog.xsl
  XSL Stylesheet: transforms catalog.xml → HTML table
  Links the external CSS: catalog.css
  ================================================
-->

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Output as HTML -->
  <xsl:output
    method="html"
    version="5.0"
    encoding="UTF-8"
    indent="yes"
    doctype-system="about:legacy-compat"/>

  <!-- ============================================================
       ROOT TEMPLATE — builds the full HTML page
       ============================================================ -->
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>CD Catalog</title>

        <!-- ✅ Link to the external CSS stylesheet -->
        <link rel="stylesheet" type="text/css" href="catalog.css"/>
      </head>

      <body>

        <!-- Page Header -->
        <header>
          <h1>&#127925; CD <span>Catalog</span></h1>
          <p class="subtitle">Music Collection</p>
        </header>

        <!-- Table Wrapper -->
        <div class="table-wrapper">
          <table>
            <thead>
              <tr>
                <th>#</th>
                <th>Title</th>
                <th>Artist</th>
                <th>Year</th>
                <th>Price</th>
                <th>Genre</th>
                <th>Country</th>
              </tr>
            </thead>
            <tbody>
              <!-- Iterate over every <cd> element -->
              <xsl:for-each select="catalog/cd">
                <!-- Sort by artist name ascending -->
                <xsl:sort select="artist" order="ascending"/>

                <tr>
                  <!-- Row number via XSL position() -->
                  <td class="col-num">
                    <xsl:value-of select="position()"/>
                  </td>

                  <!-- Album title -->
                  <td class="col-title">
                    <xsl:value-of select="title"/>
                  </td>

                  <!-- Artist -->
                  <td class="col-artist">
                    <xsl:value-of select="artist"/>
                  </td>

                  <!-- Release year -->
                  <td class="col-year">
                    <xsl:value-of select="year"/>
                  </td>

                  <!-- Price with $ prefix -->
                  <td class="col-price">
                    $<xsl:value-of select="format-number(price,'#,##0.00')"/>
                  </td>

                  <!-- Genre wrapped in a badge span -->
                  <td class="col-genre">
                    <span><xsl:value-of select="genre"/></span>
                  </td>

                  <!-- Country of origin -->
                  <td class="col-country">
                    <xsl:value-of select="country"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>

        <!-- Footer with total count -->
        <footer>
          Total albums: <xsl:value-of select="count(catalog/cd)"/>
          &#160;&#160;|&#160;&#160;
          Sorted alphabetically by artist
        </footer>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
