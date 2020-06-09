class AddProductToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :product, foreign_key: true
  end
end
