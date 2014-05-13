class AddPendingFieldToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :is_approved, :boolean, default: false
  end
end
