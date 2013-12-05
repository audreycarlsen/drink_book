class CreateDrankBookRecipes < ActiveRecord::Migration
  def change
    create_table :drank_book_recipes do |t|
      t.integer :drank_book_id
      t.integer :recipe_id
      t.timestamps
    end
  end
end
