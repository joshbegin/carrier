class State < ActiveRecord::Base
  attr_accessible :abbreviation, :name
  
  has_many :companies

end
