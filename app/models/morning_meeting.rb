class MorningMeeting < ApplicationRecord

  validates_presence_of :is_closed
  validates_presence_of :machine_id

  # https://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
  #   http://pmdsdata:3001/morning_meetings?closeditems=false
  scope :closeditems, -> (param1) { where("is_closed like ?", "#{param1}%")}

  # Other notes ..
  # scope :status_open, -> (status_open) { where status: status }
  # http://aspiringwebdev.com/use-activerecord-scopes-not-class-methods-in-rails-to-avoid-errors/
  # scope where(:is_closed => 'false')
  # https://stackoverflow.com/questions/11320945/rails-scope-where-does-not-equal
  #   http://pmdsdata:3001/morning_meetings?openitems
  #   The scope body needs to be callable.  ---  scope :openitems,   where( :is_closed => "false" ) 
  # scope :openitems, where("is_closed IS ?", "false")

  
end