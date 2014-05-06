class AddSlugToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :slug, :string, unique: true
  end

  def self.down
    remove_column :categories, :slug
  end
end
