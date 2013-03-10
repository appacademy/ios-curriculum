class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "Student"
  
  has_many :rsvps
  has_many :attendees, :through => :rsvps, :source => :student
end
