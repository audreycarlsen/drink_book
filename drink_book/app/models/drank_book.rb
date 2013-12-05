class DrankBook < ActiveRecord::Base
  has_many :drank_book_recipes
  has_many :recipes, through: :drank_book_recipes
end
