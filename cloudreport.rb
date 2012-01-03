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
#

require 'rubygems'
require 'nokogiri'
require 'openssl'
require 'base64'
require 'cgi'
require 'yaml'

begin
config = YAML::parse(File.open("creds.yml")).transform
rescue
puts "Can't find creds.yml file - Please create first"
exit
end

# API calls that will get executed against the endpoint
# Some of these commands require you to have DOMAIN ADMIN priviledges!

api_calls = %w{ 
                  listCapabilities listDomains listZones listNetworks listHypervisors listServiceOfferings
                  listDiskOfferings listNetworkOfferings listTemplates\&templatefilter=community\&name=right 
              }

# Credentials & Endpoint are read from ./creds.yml
@CLOUD_API_KEY        = config['cloud_api_key']
@CLOUD_API_SECRET     = config['cloud_api_secret']
@CLOUD_API_ENDPOINT   = config['cloud_api_endpoint']

# XML Template
@XML_TEMPLATE = File.dirname(__FILE__) + "/cloudstack.xslt"

# Build a CloudStack query string and sign it.
#
def query(string)
# TODO: url encode values for each keypair prior to signing.  
# TODO: Urlencode '+' w/ '%20'
  pre_signed = "apiKey=#{@CLOUD_API_KEY}&" + "command=" + string.split("&").sort.join("&")
  sign(@CLOUD_API_SECRET, pre_signed)
end

# Return Signature
#
def sign(secret,string)
  CGI.escape(Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::SHA1.new, secret, string.downcase)).chomp)
end

def callapi(command)
# TODO: Send command & check for success response.  Add retry?
  cmd="#{@CLOUD_API_ENDPOINT}" + "command=" + command + "&apiKey=#{@CLOUD_API_KEY}" + "&signature=#{query(command)}"
  res_code=`curl -sw %{http_code} "#{cmd}"`
  res_code   unless res_code.match("does not exist")
end

def dumpxml(command)
  rawxml = callapi(command)
  xml = Nokogiri::XML(rawxml)
  xslt = Nokogiri::XSLT(File.read(@XML_TEMPLATE))
  puts xslt.transform(xml)
end


# Cycle through each of the API calls.
# Build a properly formatted API string, sign it, call it & transform the results.
api_calls.each { |cmd| dumpxml(cmd) }
