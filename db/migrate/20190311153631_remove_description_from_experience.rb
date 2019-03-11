class RemoveDescriptionFromExperience < ActiveRecord::Migration[5.2]
  def change
    change_column :experiences, :description, :text
  end
end
