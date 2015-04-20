class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :city
      t.integer :capacity
      t.boolean :availability
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
