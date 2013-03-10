# Associations with unconventional foreign\_key names

This project demonstrates an example where students and events are connected
in multiple ways.

The events table has a creator\_id column which contains a student id. If we
had named this column "student\_id", we could just slap a
belongs\_to/has\_many association on the Student and Event classes. But here
we have to do a bit more work

To create an ActiveRecord association from Event to Student, we write:

    class Event < ActiveRecord::Base
       belongs_to :creator, :class_name => "Student"
       # ...
    end

This tells AR that the association is named "creator", and that we should look
up the creator\_id field in the students table.

To go the other way, we write:

    class Student < ActiveRecord::Base
      has_many :created_events, :class_name => "Event", :foreign_key => :creator_id
      # ...
    end

This names the association "created\_events", and tells AR to find
created\_events by looking in the events table, and the column "creator\_id".

Incidentally, _foreign key_ is jargon that means an integer which is used to
lookup ids in another table.

# A second association between Student and Event

Students and events are related through the creator/created\_events pair of
associations.  They are also related by who is attending what event.

This is a many-to-many relationship, so we create a join table named RSVP:

    create_table "rsvps" do |t|
      t.integer  "event_id"
      t.integer  "student_id"
    end

As usual, we add the following rsvp associations:

    class Rsvp < ActiveRecord::Base
      belongs_to :event
      belongs_to :student
    end

Then, to connect a student to his events, we add:

	class Student < ActiveRecord::Base
	  has_many :rsvps
	  has_many :attending_events, :through => :rsvps, :source => :event
	end

Here, for clarity that these are events the student _attends_ (rather than
_creates_), we name the association "attending\_events". As usual, AR will
look up the student's student\_id in the rsvps table. Because of the custom
association name, we need to specify a :source, to tell it to follow the
event\_id column in rsvps to the events table.

The code to get attending Students from an Event is symmetric.