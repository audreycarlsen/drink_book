class Ingredient < ActiveRecord::Base
    has_many :ingredient_recipes
    has_many :recipes, through: :ingredient_recipes

 #    def self.search(search)
 #    	if search
 #    		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
 #  		else
 #    		find(:all)
 #  		end
	# end
end
