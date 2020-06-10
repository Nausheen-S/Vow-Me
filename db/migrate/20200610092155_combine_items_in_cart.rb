class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      sums = cart.cart_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.cart_items.where(product_id: product_id).delete_all

          item = cart.cart_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    #split items with a quantity of 1 or more into multiple items
    CartItem.where("quantity>1").each do |cart_item|
      cart_item.quantity.times do
        CartItem.create(
          cart_id: cart_item.cart_id,
          product_id: cart_item.product_id,
          quantity: 1
        )
      end
      # remove original line item
      cart_item.destroy
    end
  end
end