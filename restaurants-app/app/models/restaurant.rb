class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :cuisine, :address
  
  has_many :reviews
end
