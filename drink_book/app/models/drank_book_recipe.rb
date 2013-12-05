class DrankBookRecipe < ActiveRecord::Base
  belongs_to :drank_book
  belongs_to :recipe
end
