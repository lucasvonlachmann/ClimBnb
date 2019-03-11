class AddCoordinatesToMountain < ActiveRecord::Migration[5.2]
  def change
    add_column :mountains, :latitude, :float
    add_column :mountains, :longitude, :float
  end
end
