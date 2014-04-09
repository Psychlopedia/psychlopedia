class RemoveLocationFromExperience < ActiveRecord::Migration
  def self.up
    remove_column :experiences, :location
  end

  def self.down
    add_column :experiences, :location, :string
  end
end
