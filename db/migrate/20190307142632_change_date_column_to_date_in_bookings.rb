class ChangeDateColumnToDateInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :date, 'date USING CAST(date AS date)'
  end
end
