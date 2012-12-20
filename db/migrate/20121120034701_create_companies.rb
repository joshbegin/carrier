class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :parent_company_id
      t.integer :company_type_id
      t.integer :state_id
      t.string :name
      t.string :alias
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :zip
      t.string :url
      t.string :naic_code
      t.string :ai_carrier_code
      t.text :notes

      t.timestamps
    end
    
    add_index :companies, :name, unique: true
    
  end
end
