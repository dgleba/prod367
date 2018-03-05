require 'rails_helper'

RSpec.describe "morning_meetings/index", type: :view do
  before(:each) do
    assign(:morning_meetings, [
      MorningMeeting.create!(
        :name => "Name",
        :priority => "Priority",
        :machine_id => "Machine",
        :problem_description => "Problem Description",
        :running => "Running",
        :responsibility => "Responsibility",
        :timing_plan_for_repair => "MyText",
        :followup_comments => "MyText",
        :is_closed => "Is Closed"
      ),
      MorningMeeting.create!(
        :name => "Name",
        :priority => "Priority",
        :machine_id => "Machine",
        :problem_description => "Problem Description",
        :running => "Running",
        :responsibility => "Responsibility",
        :timing_plan_for_repair => "MyText",
        :followup_comments => "MyText",
        :is_closed => "Is Closed"
      )
    ])
  end

  it "renders a list of morning_meetings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Priority".to_s, :count => 2
    assert_select "tr>td", :text => "Machine".to_s, :count => 2
    assert_select "tr>td", :text => "Problem Description".to_s, :count => 2
    assert_select "tr>td", :text => "Running".to_s, :count => 2
    assert_select "tr>td", :text => "Responsibility".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Is Closed".to_s, :count => 2
  end
end
