class AddRememberTokenAndActiveToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token, :string
  	add_column :users, :active, :boolean, default: false
    add_index  :users, :remember_token
  end
end
