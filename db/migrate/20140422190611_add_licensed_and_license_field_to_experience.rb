class AddLicensedAndLicenseFieldToExperience < ActiveRecord::Migration
  def self.up
    add_column :experiences, :is_licensed, :boolean, default: false
    add_column :experiences, :license, :string
  end

  def self.down
    remove_column :experiences, :is_licensed
    remove_column :experiences, :license
  end
end
