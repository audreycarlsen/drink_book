class IngredientRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def self.search(search)
	if search
    	find(:all, :conditions => ["ingredients LIKE ?", "%#{search}%"])
    	# find(:all, :conditions => ['ingredients LIKE ?', '%#{params[:search]}%'])
  	else
    	find(:all)
  	end
  end
end
