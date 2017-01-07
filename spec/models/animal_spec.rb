require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is can be instantiated' do
    expect{ Animal.new }.to_not raise_error
  end

  it 'has a common name, latin name, and kingdom' do
    animal = Animal.new(name: 'Leopard', latin_name: 'Spotted Leopard', kingdom: 'Cat')
    expect(animal.save).to eq true

    new_animal = Animal.find_by(name: 'Leopard')
    expect(new_animal.name).to eq 'Leopard'
    expect(new_animal.latin_name).to eq 'Spotted Leopard'
    expect(new_animal.kingdom).to eq 'Cat'
  end
end
