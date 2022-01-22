class DraftOrderLine < ApplicationRecord
  belongs_to :draft_order
  belongs_to :product

  def calculate_prices(line_items)
    line_items.draft_order_lines.each do |line|
      product = Product.find(line.product_id).first
      line.price = product.price * line.quantity
    end
    line_items
  end
end
