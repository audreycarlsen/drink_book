class AddDrankbookIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :drank_book_id, :integer
    # ':drank_book_id' needs to match 'belongs_to: drank_book in Recipe model'
  end
end