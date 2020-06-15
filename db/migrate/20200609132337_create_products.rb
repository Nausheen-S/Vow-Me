class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name



      t.timestamps
    end
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end