require 'ap'
require 'highline/import'
require 'json'
require 'rest-client'
require 'addressable/uri'

def do_reddit_login(user_name, password)
  login_uri = Addressable::URI.new({
    :scheme => "http",
    :host => "www.reddit.com",
    :path => "/api/login/#{user_name}"
  })
  
  query_values = {
    :user => user_name,
    :passwd => password,
    :api_type => "json"    
  }
  
  response = RestClient.post(login_uri.to_s, query_values)
  
  raise "Failed to login!" unless response.code == 200
  
  modhash = JSON.parse(response)["json"]["data"]["modhash"]
  reddit_session = response.cookies["reddit_session"]
  
  { :modhash => modhash, :reddit_session => reddit_session }
end

def get_aa_posts(session)
  uri = Addressable::URI.new({
    :scheme => "http",
    :host => "www.reddit.com",
    :path => "/r/AppAcademy/new.json",
    
    :query_values => {
      :sort => "new"
    }
  })
  
  response = RestClient.get(uri.to_s, {
    :cookies => {
      :reddit_session => session[:reddit_session]
    }
  })
  
  raise "Couldn't get new posts!" unless response.code == 200
  
  # XXX get posts here :-)
  ap JSON.parse(response)
end

def user_login
  user_name = ask("username: ")
  passwd = ask("password: ") { |q| q.echo = false }
  
  session = do_reddit_login(user_name, passwd)
  get_aa_posts(session)
end

user_login if __FILE__ == $0
