class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :occupation, :string
    add_column :users, :admin, :boolean
  end
end
