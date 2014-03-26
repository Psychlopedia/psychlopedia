class AddLocationToExperience < ActiveRecord::Migration
  def self.up
    add_column :experiences, :location, :string
  end

  def self.down
    remove_column :experiences, :location
  end
end
