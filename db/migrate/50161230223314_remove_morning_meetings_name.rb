class RemoveMorningMeetingsName < ActiveRecord::Migration[5.0]
  def change
   rename_column :morning_meetings, :name,  :name_off

  end
end
