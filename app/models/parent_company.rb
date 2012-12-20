class ParentCompany < ActiveRecord::Base
  attr_accessible :alias, :name
  
  has_many :companies
  
  validates :name, presence: true,
                  uniqueness: true
end
