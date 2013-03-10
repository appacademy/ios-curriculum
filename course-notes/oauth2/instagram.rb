require 'addressable/uri'
require 'json'
require 'oauth2'
require 'rest-client'

# instagram auth: http://instagram.com/developer/authentication/
# instagram api doc: http://instagram.com/developer/endpoints/

CLIENT_TOKEN = "9bf03da97dcf400282dcf9203d019859"
CLIENT_TOKEN_SECRET = "XXXX"

def authorize_url()
  # Step 1: generate URL that user visits to authorize
  # paste into browser, authorize, get code param
  url = Addressable::URI.new({
    :scheme => "https",
    :host => "api.instagram.com",
    :path => "/oauth/authorize",
    :query_values => {
      :client_id => CLIENT_TOKEN,
      :scope => "basic",
      :redirect_uri => "http://localhost",
      :response_type => "code",
      :state => "YOUR_USER_ID_GOES_HERE"
    }
  })
  
  url.to_s
end

def get_access_token(code)
  # Step 2: paste in temporary code, request permanent access_token
  response = RestClient.post(Addressable::URI.new({
    :scheme => "https",
    :host => "api.instagram.com",
    :path => "/oauth/access_token",
  }).to_s, {
    :client_id => CLIENT_TOKEN,
    :client_secret => CLIENT_TOKEN_SECRET,
    :redirect_uri => "http://localhost",
    :grant_type => "authorization_code",
    :code => code
  })
  
  JSON.parse(response)["access_token"]
end

def get_feed(access_token)
  # Step 3: begin making requests!
  response = RestClient.get(Addressable::URI.new({
    :scheme => "https",
    :host => "api.instagram.com",
    :path => "/v1/users/self/feed",
    :query_values => {
      :access_token => access_token
    }
  }).to_s)
  
  JSON.parse(response)
end
