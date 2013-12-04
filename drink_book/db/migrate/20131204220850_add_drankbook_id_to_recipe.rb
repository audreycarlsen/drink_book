class AddDrankbookIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :drankbook_id, :integer
  end
end
