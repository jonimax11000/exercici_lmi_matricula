<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">

    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="pagina"
                                page-height="29.7cm"
                                page-width="21cm"
                                margin="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="pagina">
        <fo:flow flow-name="xsl-region-body">
          
          <!-- Títol -->
          <fo:block text-align="center" font-size="20pt" font-weight="bold" space-after="1cm">
            Matrícula Institut
          </fo:block>

          <!-- Dades Personals en Taula -->
          <fo:table table-layout="fixed" width="100%" border="solid 1px black" border-collapse="collapse" space-after="1cm">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>Nom:</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>
                    <!-- Incorpora aci la ruta per accedir al nom de l'alumne -->
                    <xsl:value-of select="matricula/alumne/nom"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>Cognoms:</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>
                    <!-- Incorpora aci la ruta per accedir als cognoms de l'alumne -->
                    <xsl:value-of select="matricula/alumne/cognoms"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>Correu electrònic:</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>
                      <!-- Incorpora aci la ruta per accedir al correu de l'alumne -->
                    <xsl:value-of select="matricula/alumne/email"/>
                    </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>Adreça:</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>
                      <!-- Incorpora aci la ruta per accedir a l'adreça de l'alumne -->
                    <xsl:value-of select="matricula/alumne/adreca"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>Telèfon:</fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black" padding="5pt">
                  <fo:block>
                      <!-- Incorpora aci la ruta per accedir al telèfon de l'alumne -->
                    <xsl:value-of select="matricula/alumne/telefon"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- Cicle i Curs -->
          <fo:block font-size="14pt" font-weight="bold" space-after="0.5cm">
            Estudis:
          </fo:block>

          <fo:block space-after="0.2cm">
            <fo:inline font-weight="bold">Cicle: </fo:inline>
              <!-- Incorpora aci la ruta per accedir al valor del cicle -->
            <xsl:value-of select="matricula/cicle"/>
          </fo:block>

          <fo:block space-after="0.5cm">
            <fo:inline font-weight="bold">Curs: </fo:inline>
              <!-- Incorpora aci la ruta per accedir al valor del curs -->
            <xsl:value-of select="matricula/curs"/>
          </fo:block>

          <!-- Mòduls -->
          <fo:block font-size="14pt" font-weight="bold" space-after="0.5cm" space-before="1cm">
            Mòduls:
          </fo:block>

          <fo:list-block provisional-label-separation="0.5cm" provisional-distance-between-starts="1cm">
            <!-- Modifica el select pe incorpora  la ruta per accedir al cadascun dels mòduls -->
            <xsl:for-each select="matricula/moduls/modul">
              <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                  <fo:block>•</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                  <fo:block>
                    <xsl:value-of select="."/>
                  </fo:block>
                </fo:list-item-body>
              </fo:list-item>
            </xsl:for-each>
          </fo:list-block>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>

  </xsl:template>

</xsl:stylesheet>
