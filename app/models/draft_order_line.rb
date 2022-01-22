class DraftOrderLine < ApplicationRecord
  belongs_to :draft_order
  belongs_to :product

  class << self
    def generate_line_items(order, product)
      line_items = order.draft_order_lines

      if (line_items.any?)
        product_line = line_items.where(product_id: product.id).first
        if (product_line.present?)
          quantity = product_line.quantity + 1
          product_line.update(
            quantity: quantity,
            price: product.price * quantity,
          )
          return
        end
      end

      order.draft_order_lines.create(
        product_id: product.id,
        quantity: 1,
        price: product.price,
      )
    end
  end
end
