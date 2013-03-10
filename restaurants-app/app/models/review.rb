class Review < ActiveRecord::Base
  validates_presence_of :reviewer, :title, :body, :restaurant_id
  
  belongs_to :restaurant
end
