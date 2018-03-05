require 'rails_helper'

RSpec.describe "MorningMeetings", type: :request do
  describe "GET /morning_meetings" do
    it "works! (now write some real specs)" do
      get morning_meetings_path
      expect(response).to have_http_status(200)
    end
  end
end
