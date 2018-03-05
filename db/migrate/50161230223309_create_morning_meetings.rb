class CreateMorningMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :morning_meetings do |t|
      t.string :name
      t.string :priority
      t.string :machine_id
      t.string :problem_description
      t.string :running
      t.string :responsibility
      t.text :timing_plan_for_repair
      t.text :followup_comments
      t.string :is_closed

      t.timestamps
    end
  end
end
