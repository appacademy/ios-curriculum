require 'addressable/uri'
require 'json'
require 'rest_client'

def request_places(lat, lng, keyword)
  path = "https://maps.googleapis.com/maps/api/place/search/json"
  query_values = {
      key: 'AIzaSyBFiv8ziB9Z6_0v6e0CO7BHzzxE2hVyUj8',
      location: "#{lat},#{lng}",
      keyword: keyword,
      rankby: 'distance',
      sensor: 'false'
  }
  
  RestClient.get(path, { :params => query_values })
end

def parse_response(response)
  JSON.parse(response, :symbolize_names => true)
end

def get_place_names(parsed_response)
  parsed_response[:results].map { |place| place[:name] }
end

def get_ice_cream_in_san_francisco
  req = get_ice_cream_in_san_francisco_request
  response = execute_request(req)
  parsed_response = parse_response(response)
  get_place_names(parsed_response)
end

def find_places(lat, lng, query)
  response = request_places(lat, lng, query)
  # puts "Response: #{response}"
  parsed_response = parse_response(response)
  # puts "Parsed response: #{parsed_response}"
  get_place_names(parsed_response)
end
