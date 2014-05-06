class CreateExperienceCategories < ActiveRecord::Migration
  def change
    create_table :experience_categories do |t|
      t.integer :experience_id
      t.integer :category_id

      t.timestamps
    end
  end
end
