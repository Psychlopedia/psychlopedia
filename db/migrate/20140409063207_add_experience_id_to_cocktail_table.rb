class AddExperienceIdToCocktailTable < ActiveRecord::Migration
  def self.up
    add_column :cocktails, :experience_id, :integer
  end

  def self.down
    remove_column :cocktails, :experience_id
  end
end
