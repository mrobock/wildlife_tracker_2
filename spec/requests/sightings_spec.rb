require 'rails_helper'

RSpec.describe "Sightings", type: :request do
  describe "GET /sightings" do
    it "works! (now write some real specs)" do
      get sightings_path
      expect(response).to have_http_status(200)
    end
  end
end
