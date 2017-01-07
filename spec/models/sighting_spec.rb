require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it "can be created" do
    animal = Animal.create(
      name: "Scooby",
      latin_name: "Doobidus",
      kingdom: "Dogerino"
    )

    sighting = Sighting.new(
      date: "01-15-2016",
      time: "04:00",
      latitude: 100,
      longitude: 100.0,
      animal_id: animal.id
    )

    expect{ sighting.save }.to_not raise_error
  end

  it "can not be created without an animal id" do
    animal = Animal.create(
      name: "Scooby",
      latin_name: "Doobidus",
      kingdom: "Dogerino"
    )

    sighting = Sighting.new(
      date: "01-15-2016",
      time: "04:00",
      latitude: 100,
      longitude: 100.0
    )
    expect(sighting.save).to eq false
  end
end
