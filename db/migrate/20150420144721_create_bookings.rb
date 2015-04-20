class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :starting_on
      t.date :ending_on
      t.integer :travellers
      t.references :user, index: true, foreign_key: true
      t.references :flat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
