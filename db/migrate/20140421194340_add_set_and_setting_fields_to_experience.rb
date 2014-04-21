class AddSetAndSettingFieldsToExperience < ActiveRecord::Migration
  def self.up
    add_column :experiences, :set, :string
    add_column :experiences, :setting, :string
  end

  def self.down
    remove_column :experiences, :set
    remove_column :experiences, :setting
  end
end
