#!/usr/bin/ruby 
#
# CloudStack Reporter
# 
# Robert@rightscale.com
#
# Queries CloudStack API for configuration and
# generates a pretty report using XSLT to transform 
# the resulting XML from the API calls.
#
# requires: cs_api.rb to handle the signed api request.
#

require 'nokogiri'

api_calls = %w{ 
                  listPods listCapabilities listDomains listZones listHypervisors listServiceOfferings
                  listDiskOfferings listNetworkOfferings listTemplates\&templatefilter=community\&name=right 
              }

def dumpxml(command)
  rawxml = `./cs_api.rb command=#{command}`
  xml = Nokogiri::XML(rawxml)
  xslt = Nokogiri::XSLT(File.read('./cloudstack.xslt'))
  puts xslt.transform(xml)
end

api_calls.each { |x| dumpxml(x) }
