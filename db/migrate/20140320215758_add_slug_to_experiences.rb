class AddSlugToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :slug, :string
    add_index :experiences, :slug, unique: true
  end

  def down
    remove_index :experiences, :slug
    remove_column :experiences, :slug
  end
end
