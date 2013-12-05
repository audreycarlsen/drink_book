class Recipe < ActiveRecord::Base
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
  belongs_to :drank_book
end