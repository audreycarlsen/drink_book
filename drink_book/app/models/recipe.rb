class Recipe < ActiveRecord::Base
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :drank_book_recipes
  has_many :drank_books, through: :drank_book_recipes
  has_many :recipe_tools
  has_many :tools, through: :recipe_tools

 #  def self.search(search)
	# if search
 #    	find(:all, :conditions => ["ingredients LIKE ?", "%#{search}%"])
 #    	# find(:all, :conditions => ['ingredients LIKE ?', '%#{params[:search]}%'])
 #  	else
 #    	find(:all)
 #  	end
 #  end
end