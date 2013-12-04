class AddDescriptionAndProcessToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :text
    add_column :recipes, :process, :text
  end
end
