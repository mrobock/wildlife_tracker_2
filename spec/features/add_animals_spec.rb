require 'rails_helper'

RSpec.feature "AddAnimals", type: :feature do
  context "Landing page loads properly" do
    Steps "Going to the landing page" do
      Given "I am on the landing page" do
        visit '/'
      end
      Then "I see a welcome message" do
        expect(page).to have_content("Welcome to the Animal Kingdom")
      end
    end
  end

  context "I can get to the Animal index from the landing page" do
    Steps "Going to the animal page" do
      Given "I am on the landing page" do
        visit '/'
        click_link('Animals')
      end
      Then "I can see the animal index welcome message" do
        expect(page).to have_content("Animal listing(s)")
      end
    end
  end

  context "I can go through the data lifecycle for an animal" do
    Steps "Going to the animal page and adding a new animal" do
      Given "I am on the animal index page" do
        visit '/animals'
        click_link('New Animal')
      end

      Then "I can input info into animal fields" do
        fill_in "animal[name]", with: "Scooby Doo"
        fill_in "animal[latin_name]", with: "Scoobimus Dooimus"
        fill_in "animal[kingdom]", with: "Doge"
        click_button "Create Animal"

        expect(page).to have_content("Animal was successfully created")
        expect(page).to have_content("Scooby Doo")
        expect(page).to have_content("Scoobimus Dooimus")
        expect(page).to have_content("Doge")
      end
      And "I can go back to the animal index page" do
        click_link('Back')
        expect(page).to have_content("Animal listing(s)")
      end

      Then "I can go to the edit page" do
        click_link('Edit')
        expect(page).to have_content("Editing Animal")
      end
      And "I can edit the animal" do
        fill_in "animal[name]", with: 'Scrappy Doo'
        fill_in "animal[latin_name]", with: 'Scrappimus Dooimus'
        fill_in "animal[kingdom]", with: 'Dogerino'
        click_button "Update Animal"

        expect(page).to have_content("Animal was successfully updated")
        expect(page).to have_content("Scrappy Doo")
        expect(page).to have_content("Scrappimus Dooimus")
        expect(page).to have_content("Dogerino")
      end

      Then "I can go back to the animal index page" do
        click_link('Back')
        expect(page).to have_content("Animal listing(s)")
      end
      And "I can delete an animal" do
        click_link('Destroy')
        expect(page).to have_content("Animal was successfully destroyed")
      end
    end
  end

end
