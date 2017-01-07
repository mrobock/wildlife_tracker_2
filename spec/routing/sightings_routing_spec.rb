require "rails_helper"

RSpec.describe SightingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sightings").to route_to("sightings#index")
    end

    it "routes to #new" do
      expect(:get => "/sightings/new").to route_to("sightings#new")
    end

    it "routes to #show" do
      expect(:get => "/sightings/1").to route_to("sightings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sightings/1/edit").to route_to("sightings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sightings").to route_to("sightings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sightings/1").to route_to("sightings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sightings/1").to route_to("sightings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sightings/1").to route_to("sightings#destroy", :id => "1")
    end

  end
end
