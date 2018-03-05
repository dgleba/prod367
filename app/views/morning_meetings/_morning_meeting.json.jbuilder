json.extract! morning_meeting, :id, :name, :priority, :machine_id, :problem_description, :running, :responsibility, :timing_plan_for_repair, :followup_comments, :is_closed, :created_at, :updated_at
json.url morning_meeting_url(morning_meeting, format: :json)
