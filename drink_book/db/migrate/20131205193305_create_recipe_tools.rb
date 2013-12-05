class CreateRecipeTools < ActiveRecord::Migration
  def change
    create_table :recipe_tools do |t|
      t.integer :recipe_id
      t.integer :tool_id
      t.timestamps
    end
  end
end
