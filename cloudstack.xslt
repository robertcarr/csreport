<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method = "html" omit-xml-declaration="no"/>
<xsl:template match = "listcapabilitiesresponse/capability">
CloudStack Capabilities as reported by the CloudStack API
---------------------------------------------------------

  CloudStack Version                :  <xsl:value-of select="cloudstackversion" />
  Security Groups Enabled           :  <xsl:value-of select="securitygroupsenabled"/>
  Supports ELB                      :  <xsl:value-of select="supportELB"/>
  Firewall Rule UI Enabled          :  <xsl:value-of select="supportELB"/>
</xsl:template>

<xsl:template match = "listhypervisorsresponse">
  Hypervisors                       :  <xsl:value-of select="count" />
  ----------------------------------------
  <xsl:for-each select = "hypervisor">
  Hypervisors found     : <xsl:value-of select="name" />
  </xsl:for-each >
</xsl:template>
<xsl:template match = "listzonesresponse">
  Total Zones                       :  <xsl:value-of select="count" />
  ----------------------------------------
  <xsl:for-each select = "zone">
  Zone ID     : <xsl:value-of select="id" />
  Zone Name   : <xsl:value-of select="name" />
  Network Type: <xsl:value-of select="networktype" />
  SG Enabled  : <xsl:value-of select="securitygroupsenabled" />
  ==
  </xsl:for-each>
</xsl:template>

<xsl:template match = "listdomainsresponse">
Known Domains <xsl:value-of select = "count" />
-----------------
<xsl:for-each select = "domain" >
  ID:  <xsl:value-of select="id" />
  Name      : <xsl:value-of select="name" />
  Level     : <xsl:value-of select="level" />
  Has Child : <xsl:value-of select="haschild" />
  ==
</xsl:for-each>
</xsl:template>

<xsl:template match = "listserviceofferingsresponse">
Service Offerings <xsl:value-of select = "count" />
-----------------
<xsl:for-each select = "serviceoffering" >
  ID:  <xsl:value-of select="id" />
  Name      : <xsl:value-of select="name" />
  Display   : <xsl:value-of select="displaytext" />
  CPU Speed : <xsl:value-of select="cpuspeed" />
  Memory    : <xsl:value-of select="memory" />
  Storage   : <xsl:value-of select="storagetype" />
  HA        : <xsl:value-of select="offerha" />
  ==
</xsl:for-each>
</xsl:template>

<xsl:template match = "listdiskofferingsresponse">
Disk offerings <xsl:value-of select = "count" />
-----------------
<xsl:for-each select = "diskoffering" >
  id:  <xsl:value-of select="id" />
  name      : <xsl:value-of select="name" />
  display   : <xsl:value-of select="displaytext" />
  disk size : <xsl:value-of select="disksize" />
  ==
</xsl:for-each>
</xsl:template>

<xsl:template match = "listnetworkofferingsresponse">
Network offerings <xsl:value-of select = "count" />
-----------------
<xsl:for-each select = "networkoffering" >
  id:  <xsl:value-of select="id" />
  name      : <xsl:value-of select="name" />
  display   : <xsl:value-of select="displaytext" />
  traffic   : <xsl:value-of select="traffictype" />
  is default: <xsl:value-of select="isdefault" />
  vlan      : <xsl:value-of select="specifyvlan" />
  avail     : <xsl:value-of select="availability" />
  G IP type : <xsl:value-of select="guestiptype" />
  Net Rate  : <xsl:value-of select="networkrate" />
  ==
</xsl:for-each>
</xsl:template>


</xsl:stylesheet>



