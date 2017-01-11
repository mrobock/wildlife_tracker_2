class AddColorToSighting < ActiveRecord::Migration
  def change
    add_column :sightings, :color, :string
  end
end
