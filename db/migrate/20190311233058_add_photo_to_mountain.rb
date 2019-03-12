class AddPhotoToMountain < ActiveRecord::Migration[5.2]
  def change
    add_column :mountains, :photo, :string
  end
end
