require 'rails_helper'

RSpec.describe "morning_meetings/show", type: :view do
  before(:each) do
    @morning_meeting = assign(:morning_meeting, MorningMeeting.create!(
      :name => "Name",
      :priority => "Priority",
      :machine_id => "Machine",
      :problem_description => "Problem Description",
      :running => "Running",
      :responsibility => "Responsibility",
      :timing_plan_for_repair => "MyText",
      :followup_comments => "MyText",
      :is_closed => "Is Closed"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Priority/)
    expect(rendered).to match(/Machine/)
    expect(rendered).to match(/Problem Description/)
    expect(rendered).to match(/Running/)
    expect(rendered).to match(/Responsibility/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Is Closed/)
  end
end
