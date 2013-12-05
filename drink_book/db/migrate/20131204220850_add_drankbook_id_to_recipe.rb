class AddDrankbookIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :drank_book_id, :integer
  end
end
