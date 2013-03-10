# This example shows how to use oauth2 with github's API to authorize the
# client to perform actions on the user's behalf

require 'addressable/uri'
require 'json'
require 'oauth2'
require 'rest-client'

# github auth: http://developer.github.com/v3/users/
# github users resource: http://developer.github.com/v3/users/

# In Settings > Applications, create a new App. Get your app's client
# token/secret

# You'll need to setup a redirect where users will be sent after they
# authorize your app; for now, you can make it http://localhost
CLIENT_TOKEN = "6f9a7f66feeab8cd0a71"
CLIENT_TOKEN_SECRET = "XXXX"

def authorize_url()
  # Step 1: generate URL that user visits to authorize
  # paste into browser, authorize, get code param
  url = Addressable::URI.new({
    :scheme => "https",
    :host => "github.com",
    :path => "/login/oauth/authorize",
    :query_values => {
      :client_id => CLIENT_TOKEN,
      :scope => "user",
      :state => "YOUR_USER_ID_GOES_HERE"
    }
  })
  
  url.to_s
end

def get_access_token(code)
  # Step 2: paste in temporary code, request permanent access_token
  url = Addressable::URI.new({
    :scheme => "https",
    :host => "github.com",
    :path => "/login/oauth/access_token",
    :query_values => {
      :client_id => CLIENT_TOKEN,
      :client_secret => CLIENT_TOKEN_SECRET,
      :code => code
    }
  })
  
  response = RestClient.get(url.to_s,{
    # request a json response
    :accept => "application/json"
  })
  
  JSON.parse(response)["access_token"]
end

def get_user_emails(access_token)
  # Step 3: begin making requests!
  RestClient.get(Addressable::URI.new({
    :scheme => "https",
    :host => "api.github.com",
    :path => "/user/emails",
    :query_values => {
      :access_token => access_token
    }
  }).to_s)
end

def add_email(access_token, email)
  # Step 3: begin making requests!
  RestClient.post(Addressable::URI.new({
    :scheme => "https",
    :host => "api.github.com",
    :path => "/user/emails",
    :query_values => {
      :access_token => access_token
    }
  }).to_s, JSON.generate([email]), {
    :content_type => "application/json"
  })
end
