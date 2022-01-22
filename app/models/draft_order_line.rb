class DraftOrderLine < ApplicationRecord
  before_save :calculate_order_prices
  belongs_to :draft_order
  belongs_to :product

  def calculate_order_prices
    @order = DraftOrder.find_by_id(self.draft_order_id) # Get order
    @order.save()
  end

  class << self
    def generate_line_items(order, product)
      line_items = order.draft_order_lines

      # Checking to see if line items already exist, and updating existing product lines.
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

      # Creating new line item if none exist.
      order.draft_order_lines.create(
        product_id: product.id,
        quantity: 1,
        price: product.price,
      )
    end
  end
end
