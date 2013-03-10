require 'addressable/uri'
require 'rest_client'

HOST = "localhost:3000"

def get_restaurants
  RestClient.get(Addressable::URI.new({
    :scheme => "http",
    :host => HOST,
    :path => "/restaurants.json"
  }).to_s)
end

def create_new_restaurant(name, cuisine, address)
  begin
    RestClient.post(Addressable::URI.new({
      :scheme => "http",
      :host => HOST,
      :path => "/restaurants.json"
    }).to_s, {
      :restaurant => {
        :name => name,
        :cuisine => cuisine,
        :address => address
      }
    })
  rescue RestClient::UnprocessableEntity => e
    puts e.response
  end
end

def get_reviews_for_restaurant(restaurant_id)
  RestClient.get(Addressable::URI.new({
    :scheme => "http",
    :host => HOST,
    :path => "/reviews.json",
    :query_values => {
      :restaurant_id => restaurant_id
    }
  }).to_s)
end

def get_review(review_id)
  RestClient.get(Addressable::URI.new({
    :scheme => "http",
    :host => HOST,
    :path => "reviews/#{review_id}.json"
  }).to_s)
end

def create_new_review(title, reviewer, body, restaurant_id)
  RestClient.post(Addressable::URI.new({
    :scheme => "http",
    :host => HOST,
    :path => "reviews.json"
  }).to_s, {
    :review => {
      :title => title,
      :reviewer => reviewer,
      :body => body,
      :restaurant_id => restaurant_id
    }
  })
end