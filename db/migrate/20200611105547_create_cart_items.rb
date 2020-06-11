class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :customer, foreign_key: true
      t.integer :quantity
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
