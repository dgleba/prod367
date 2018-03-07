class AddReviewedMarkToMorningMeeting < ActiveRecord::Migration[5.0]
  def change
    add_column :morning_meetings, :reviewed_mark, :integer
  end
end
