class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :latin_name
      t.string :kingdom

      t.timestamps null: false
    end
  end
end
