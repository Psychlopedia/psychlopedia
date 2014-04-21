class ChangeColumnsOnExperiences < ActiveRecord::Migration
  def self.up
    change_column :experiences, :title, :string, null: false
    change_column :experiences, :pseudonym, :string, null: false
  end

  def self.down
    change_column :experiences, :title, :string, null: true
    change_column :experiences, :pseudonym, :string, null: true
  end
end
