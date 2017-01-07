require 'rails_helper'

RSpec.feature "AddSightings", type: :feature do

  context "I can get to the Sighting index from the landing page" do
    Steps "Going to the sighting page" do
      Given "I am on the landing page" do
        visit '/'
        click_link('Sightings')
      end
      Then "I can see the sightings index welcome message" do
        expect(page).to have_content("Sightings")
      end
    end
  end

  context "I can go through the data lifecycle for a sighting" do
    Steps "Going to the sighting page and adding a sighting" do
      Given "I am on the sighting index page and added an animal" do
        visit '/animals/new'

        fill_in "animal[name]", with: "Scooby Doo"
        fill_in "animal[latin_name]", with: "Scoobimus Dooimus"
        fill_in "animal[kingdom]", with: "Doge"
        click_button "Create Animal"

        visit '/sightings'
        click_link('New Sighting')
      end

      Then "I can input info into sighting fields" do
        expect(page).to have_content("New Sighting")
        select("2015", from: "sighting_date_1i")
        select("November", from: "sighting_date_2i")
        select("15", from: "sighting_date_3i")
        select("04", from: "sighting_time_4i")
        select("04", from: "sighting_time_5i")
        # fill_in "sighting[time]", with: "06:00"
        fill_in "sighting[latitude]", with: "100"
        fill_in "sighting[longitude]", with: "100"
        select("Scooby Doo", from: "sighting_animal_id")
        click_button "Create Sighting"

        expect(page).to have_content("Sighting was successfully created")
      end
      And "I can go back to the sighting index page" do
        click_link('Back')
        expect(page).to have_content("Sighting")
      end

      Then "I can go to the edit page" do
        click_link('Edit')
        expect(page).to have_content("Editing Sighting")
      end
      And "I can edit the sighting" do
        select("2016", from: "sighting_date_1i")
        click_button "Update Sighting"

        expect(page).to have_content("Sighting was successfully updated")
        expect(page).to have_content("2016")
      end

      Then "I can go back to the sighting index page" do
        click_link('Back')
        expect(page).to have_content("Sighting")
      end
      And "I can delete an sighting" do
        click_link('Destroy')
        expect(page).to have_content("Sighting was successfully destroyed")
      end
    end
  end
end
