require 'rest-client'
require 'addressable/uri'

def site_resource(user, password)
  url = Addressable::URI.new({
    :scheme => "http",
    :host => "localhost:3000",
    :path => "/"
  }).to_s

  RestClient::Resource.new(url, :user => user, :password => password)
end

def index_diary_entries(user, password)
  entries = site_resource(user, password)['diary_entries.json'].get
end

def create_diary_entry(user, password, title)
  payload = {
    :article => {
      :title => title
    }
  }

  entries = site_resource(user, password)['diary_entries.json'].post(payload)
end
