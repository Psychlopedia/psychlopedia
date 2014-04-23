class AddPublicationDateToExperience < ActiveRecord::Migration
  def self.up
    add_column :experiences, :publication_date, :date
  end

  def self.down
    remove_column :experiences, :publication_date
  end
end
