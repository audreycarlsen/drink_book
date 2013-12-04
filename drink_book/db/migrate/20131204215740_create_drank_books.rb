class CreateDrankBooks < ActiveRecord::Migration
  def change
    create_table :drank_books do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
