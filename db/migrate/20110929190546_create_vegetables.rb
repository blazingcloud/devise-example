class CreateVegetables < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.string :name
      t.text :description
      t.integer :price_per_unit
      t.string :unit

      t.timestamps
    end
  end
end
