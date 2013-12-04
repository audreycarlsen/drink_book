class DrankBook < ActiveRecord::Base
  has_many :recipes
end
