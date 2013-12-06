class Recipe < ActiveRecord::Base
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :drank_book_recipes
  has_many :drank_books, through: :drank_book_recipes
  has_many :recipe_tools
  has_many :tools, through: :recipe_tools

  def self.by_ingredient_name(search)
  	includes(:ingredients).where(ingredients: {name: search})
  end

end