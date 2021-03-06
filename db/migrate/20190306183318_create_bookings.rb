class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :experience, foreign_key: true
      t.references :user, foreign_key: true
      t.string :date
      t.integer :number_of_people

      t.timestamps
    end
  end
end
