<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method = "html" omit-xml-declaration="no"/>
<xsl:template match = "listcapabilitiesresponse/capability">
CloudStack Capabilities as reported by the CloudStack API
---------------------------------------------------------
API endpoint Name : <xsl:value-of select = "apiname" />
Report Date       : <xsl:value-of select = "reportdate" />

  CloudStack Version                :  <xsl:value-of select="cloudstackversion" />
  CloudStack Endpoint Tested        :  <xsl:value-of select="cloudapiendpoint" />
  Security Groups Enabled           :  <xsl:value-of select="securitygroupsenabled"/>
  Supports ELB                      :  <xsl:value-of select="supportELB"/>
  Firewall Rule UI Enabled          :  <xsl:value-of select="firewallRuleUiEnabled"/>
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
  Zone ID       : <xsl:value-of select="id" />
  Zone Name     : <xsl:value-of select="name" />
  Network Type  : <xsl:value-of select="networktype" />
  Sec Groups    : <xsl:value-of select="securitygroupsenabled" />
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

<xsl:template match = "listnetworksresponse">
Network Configurations
Networks Found <xsl:value-of select = "count" />
-----------------
<xsl:for-each select = "network" >
  ID             : <xsl:value-of select="id" />
  Display        : <xsl:value-of select="displaytext" />
  Network Name   : <xsl:value-of select="networkofferingname" />
  Network Avail. : <xsl:value-of select="networkofferingavailability" />
  Account        : <xsl:value-of select="account" />
  Domain Owner   : <xsl:value-of select="domain" />
  Is Default     : <xsl:value-of select="isdefault" />
  Is Shared      : <xsl:value-of select="isshared" />
  Network domain : <xsl:value-of select="networkdomain" />
  Sec Groups     : <xsl:value-of select="securitygroupenabled" />
  Traffic Type   : <xsl:value-of select="traffictype" />
  Brcast D. Type : <xsl:value-of select="broadcastdomaintype" />
  Net. Type      : <xsl:value-of select="type" />
  ==
</xsl:for-each>

<xsl:for-each select = "network/service" >
Service Found:  <xsl:value-of select = "name" />
<xsl:for-each select = "capability" >
   Capability    : <xsl:value-of select = "name" />  
   Value         : <xsl:value-of select = "value" />   
</xsl:for-each>
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

<xsl:template match = "listtemplatesresponse">
Community images found matching name "right"

Images found <xsl:value-of select = "count" />
-----------------
<xsl:for-each select = "template" >
  id:  <xsl:value-of select="id" />
  name      : <xsl:value-of select="name" />
  display   : <xsl:value-of select="displaytext" />
  is public : <xsl:value-of select="ispublic" />
  cross zone: <xsl:value-of select="crossZones" />
  OS Name   : <xsl:value-of select="ostypename" />
  account   : <xsl:value-of select="account" />
  zone name : <xsl:value-of select="zonename" />
  hypervisor: <xsl:value-of select="hypervisor" />
  format    : <xsl:value-of select="format" />
  size      : <xsl:value-of select="size" />
  checksum  : <xsl:value-of select="checksum" />
  ==
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>



