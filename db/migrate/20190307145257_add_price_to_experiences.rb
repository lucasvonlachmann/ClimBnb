class AddPriceToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :price, :integer
  end
end
