class AddNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :name, :string
    add_column :customers, :address, :text
  end
end