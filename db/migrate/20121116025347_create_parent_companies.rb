class CreateParentCompanies < ActiveRecord::Migration
  def change
    create_table :parent_companies do |t|
      t.string :name
      t.string :alias

      t.timestamps
    end
  end
end
