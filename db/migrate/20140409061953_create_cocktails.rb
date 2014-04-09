class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :substance
      t.string :dosage
      t.string :presentation
      t.string :adminstration

      t.timestamps
    end
  end
end
