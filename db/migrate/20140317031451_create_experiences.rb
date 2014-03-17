class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :pseudonym
      t.string :title
      t.text :body
      t.integer :hearts

      t.timestamps
    end
  end
end
