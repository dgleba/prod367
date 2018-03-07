class MorningMeeting < ApplicationRecord

  has_paper_trail  class_name: 'PapertrailTable'

  #validates_presence_of :is_closed
  validates_presence_of :machine_id, :running

  # https://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
  #   http://pmdsdata:3001/morning_meetings?closeditems=false
  # works scope :closeditems, -> (param1) { where("is_closed like ?", "#{param1}%")}
  scope :closeditemsnot, -> (param1) { where.not("is_closed like ?", "#{param1}")}

  # works scope to show open items not yet reviewed.
  # https://stackoverflow.com/questions/11317662/rails-using-greater-than-less-than-with-a-where-statement
  #   http://pmdsdata:3001/morning_meetings?notreviewed=true
  scope :notreviewed, -> (param1) { where.not("is_closed like ?", "#{param1}").where("reviewed_mark = ?", 0 )}
  
  # not used..
  # idea for date updated before today. rails scope updated_at before today
  # Model.where("created_at >= ?", Date.today)
  
  # Other notes ..
  # scope :status_open, -> (status_open) { where status: status }
  # http://aspiringwebdev.com/use-activerecord-scopes-not-class-methods-in-rails-to-avoid-errors/
  # scope where(:is_closed => 'false')
  # https://stackoverflow.com/questions/11320945/rails-scope-where-does-not-equal
  #   http://pmdsdata:3001/morning_meetings?openitems
  #   The scope body needs to be callable.  ---  scope :openitems,   where( :is_closed => "false" ) 
  # scope :openitems, where("is_closed IS ?", "false")

   
  # reset all reviewedmark to 0 on button press
  def self.reset_reviewed_sql
    ActiveRecord::Base.connection.execute <<-SQLQ
    update morning_meetings set reviewed_mark=0
    SQLQ
  end   
   
   
  
end
