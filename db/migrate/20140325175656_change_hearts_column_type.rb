class ChangeHeartsColumnType < ActiveRecord::Migration
  def self.up
    remove_column :experiences, :hearts
    add_column :experiences, :hearts, :string
  end

  def self.down
    # no going back
  end
end
