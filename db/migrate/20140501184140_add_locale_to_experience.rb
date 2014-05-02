class AddLocaleToExperience < ActiveRecord::Migration
  def self.up
    add_column :experiences, :locale, :string, default: 'es-AR'
  end

  def self.down
    remove_column :experiences, :locale
  end
end
