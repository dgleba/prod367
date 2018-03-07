class ChangeMorningMeetingsIsClosedDefault < ActiveRecord::Migration[5.0]
  def change
  change_column :morning_meetings, :is_closed,  :string, :default => 'no'

  end
end
