class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :pw, :string
    add_column :users, :verified, :boolean
    add_column :users, :email, :string
  end
end
