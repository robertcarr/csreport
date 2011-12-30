#!/usr/bin/ruby
# (c) 2011, RightScale Inc.
# Generic CloudStack API Caller
# This script should work with any CloudStack based Clouds.
# 
# See CloudStack Developer Guide for more details on constructing API calls
# and signing steps: http://docs.cloud.com/CloudStack_Documentation/Developer's_Guide%3A_CloudStack
# 
# robert@rightscale.com
#

require 'rubygems'
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

# Credentials & Endpoint are read from ./creds.yml
@CLOUD_API_KEY        = config['cloud_api_key']
@CLOUD_API_SECRET     = config['cloud_api_secret']
@CLOUD_API_ENDPOINT   = config['cloud_api_endpoint']

# Executes this default API command; Can be overriden via CLI as ARGV[0]
@api_command="command=listCapabilities"

# Build a CloudStack query string before signing
#
def query(string)
# TODO: url encode values for each keypair prior to signing.  
# TODO: Urlencode '+' w/ '%20'
  q = "apiKey=#{@CLOUD_API_KEY}&" + @api_command.split("&").sort.join("&")
  sign(@CLOUD_API_SECRET,q)
end

# Return Signature
#
def sign(secret,string) 
 CGI.escape(Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::SHA1.new, secret, string.downcase)).chomp)
end

# TODO: Send command & check for success response.  Add retry?
@api_command = ARGV[0].nil? ? @api_command : ARGV[0]
cmd="#{@CLOUD_API_ENDPOINT}" + @api_command + "&apiKey=#{@CLOUD_API_KEY}" + "&signature=#{query(@api_command)}"
#puts query(@api_command)
res_code=`curl -sw %{http_code} "#{cmd}"`
puts res_code   unless res_code.match("does not exist")
