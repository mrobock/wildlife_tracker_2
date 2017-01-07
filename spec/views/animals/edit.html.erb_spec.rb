require 'rails_helper'

RSpec.describe "animals/edit", type: :view do
  before(:each) do
    @animal = assign(:animal, Animal.create!(
      :name => "MyString",
      :latin_name => "MyString",
      :kingdom => "MyString"
    ))
  end

  it "renders the edit animal form" do
    render

    assert_select "form[action=?][method=?]", animal_path(@animal), "post" do

      assert_select "input#animal_name[name=?]", "animal[name]"

      assert_select "input#animal_latin_name[name=?]", "animal[latin_name]"

      assert_select "input#animal_kingdom[name=?]", "animal[kingdom]"
    end
  end
end
