class AddAddressToMountain < ActiveRecord::Migration[5.2]
  def change
    add_column :mountains, :address, :string
  end
end
