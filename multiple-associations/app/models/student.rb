class Student < ActiveRecord::Base
  has_many :created_events, :class_name => "Event", :foreign_key => :creator_id
  
  has_many :rsvps
  has_many :attending_events, :through => :rsvps, :source => :event
end
