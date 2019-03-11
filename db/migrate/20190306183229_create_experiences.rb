class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :mountain, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.integer :capacity
      t.integer :duration

      t.timestamps
    end
  end
end
