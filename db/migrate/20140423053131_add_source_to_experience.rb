class AddSourceToExperience < ActiveRecord::Migration
  def self.up
    add_column :experiences, :source, :string, default: 'psychlopedia'
  end

  def self.down
    remove_column :experiences, :source
  end
end
