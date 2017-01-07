require 'rails_helper'

RSpec.describe "sightings/edit", type: :view do
  before(:each) do
    @sighting = assign(:sighting, Sighting.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :animal => nil
    ))
  end

  it "renders the edit sighting form" do
    render

    assert_select "form[action=?][method=?]", sighting_path(@sighting), "post" do

      assert_select "input#sighting_latitude[name=?]", "sighting[latitude]"

      assert_select "input#sighting_longitude[name=?]", "sighting[longitude]"

      assert_select "input#sighting_animal_id[name=?]", "sighting[animal_id]"
    end
  end
end
