class Company < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :address_line_3, :ai_carrier_code, :alias, :city, :naic_code, :name, :notes, :url, :zip, :parent_company_id, :company_type_id, :state_id
  
  belongs_to :parent_company
  belongs_to :company_type
  belongs_to :state
  has_many :feeds
  
  validates :name, presence: true, uniqueness: true
  validates :company_type_id, presence: true
  
  scope :carrier, where(company_type_id: 1)
  scope :exam, where(company_type_id: 2)
end
