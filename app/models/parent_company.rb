class ParentCompany < ActiveRecord::Base
  attr_accessible :alias, :name
  
  validates :name, presence: true,
                  uniqueness: true
end
