require "rails_helper"

RSpec.describe MorningMeetingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/morning_meetings").to route_to("morning_meetings#index")
    end

    it "routes to #new" do
      expect(:get => "/morning_meetings/new").to route_to("morning_meetings#new")
    end

    it "routes to #show" do
      expect(:get => "/morning_meetings/1").to route_to("morning_meetings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/morning_meetings/1/edit").to route_to("morning_meetings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/morning_meetings").to route_to("morning_meetings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/morning_meetings/1").to route_to("morning_meetings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/morning_meetings/1").to route_to("morning_meetings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/morning_meetings/1").to route_to("morning_meetings#destroy", :id => "1")
    end

  end
end
