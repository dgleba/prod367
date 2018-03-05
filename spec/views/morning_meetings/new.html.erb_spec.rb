require 'rails_helper'

RSpec.describe "morning_meetings/new", type: :view do
  before(:each) do
    assign(:morning_meeting, MorningMeeting.new(
      :name => "MyString",
      :priority => "MyString",
      :machine_id => "MyString",
      :problem_description => "MyString",
      :running => "MyString",
      :responsibility => "MyString",
      :timing_plan_for_repair => "MyText",
      :followup_comments => "MyText",
      :is_closed => "MyString"
    ))
  end

  it "renders new morning_meeting form" do
    render

    assert_select "form[action=?][method=?]", morning_meetings_path, "post" do

      assert_select "input#morning_meeting_name[name=?]", "morning_meeting[name]"

      assert_select "input#morning_meeting_priority[name=?]", "morning_meeting[priority]"

      assert_select "input#morning_meeting_machine_id[name=?]", "morning_meeting[machine_id]"

      assert_select "input#morning_meeting_problem_description[name=?]", "morning_meeting[problem_description]"

      assert_select "input#morning_meeting_running[name=?]", "morning_meeting[running]"

      assert_select "input#morning_meeting_responsibility[name=?]", "morning_meeting[responsibility]"

      assert_select "textarea#morning_meeting_timing_plan_for_repair[name=?]", "morning_meeting[timing_plan_for_repair]"

      assert_select "textarea#morning_meeting_followup_comments[name=?]", "morning_meeting[followup_comments]"

      assert_select "input#morning_meeting_is_closed[name=?]", "morning_meeting[is_closed]"
    end
  end
end
