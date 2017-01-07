require 'rails_helper'

RSpec.describe "animals/show", type: :view do
  before(:each) do
    @animal = assign(:animal, Animal.create!(
      :name => "Name",
      :latin_name => "Latin Name",
      :kingdom => "Kingdom"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Latin Name/)
    expect(rendered).to match(/Kingdom/)
  end
end
