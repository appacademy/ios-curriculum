require 'addressable/uri'
require 'rest-client'

CLIENT_TOKEN_ID = "306d1dd15798adc90a3831eba47d1ca2ea306973"
CLIENT_TOKEN_SECRET = "XXXX"

CLIENT_WEB_SITE = "http://www.hashmaplabs.com/redirect"

def get_request_url
  Addressable::URI.new({
    :scheme => "https",
    :host => "bitly.com",
    :path => "/oauth/authorize",
    :query_values => {
      :client_id => CLIENT_TOKEN_ID,
      :redirect_uri => CLIENT_WEB_SITE
    }
  }).to_s
end

def get_access_token(code)
  response = RestClient.post(Addressable::URI.new({
    :scheme => "https",
    :host => "api-ssl.bitly.com",
    :path => "/oauth/access_token",
  }).to_s, {
    :client_id => CLIENT_TOKEN_ID,
    :client_secret => CLIENT_TOKEN_SECRET,
    :code => code,
    :redirect_uri => CLIENT_WEB_SITE
  })
  
  parsed_response = CGI::parse(response)
  
  { :access_token => parsed_response["access_token"][0],
    :api_key => parsed_response["apiKey"][0] }
end

def save_link(access_credentials)
  RestClient.get(Addressable::URI.new({
    :scheme => "https",
    :host => "api-ssl.bitly.com",
    :path => "/v3/user/link_save",
    :query_values => {
      :access_token => access_credentials[:access_token],
    
      :longUrl => "http://www.hashmaplabs.com/",
      :title => "Hash Map Labs",
      :note => "Our webpage!",
      :private => "true",
    }
  }).to_s)
end
