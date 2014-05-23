class RemoveHeartsFromExperience < ActiveRecord::Migration
  def change
    remove_column :experiences, :hearts
  end
end
