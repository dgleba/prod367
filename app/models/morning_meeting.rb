class MorningMeeting < ApplicationRecord

  validates_presence_of :is_closed
  validates_presence_of :machine_id

end
