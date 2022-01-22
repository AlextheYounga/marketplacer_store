class DraftOrder < ApplicationRecord
  validates :cart_token, presence: true

  has_many :draft_order_lines
  has_many :promotions

  def generate_order_number
    if (self.order_number.nil?)
      self.order_number = "INV000#{self.id}"
      self.save()
    end
    return
  end

  def calculate_prices
    if (self.draft_order_lines.any?)
      line_items = self.draft_order_lines
      subtotal = line_items.map { |line| line.price }.sum
      self.subtotal_price = subtotal
      self.total_discounts = 0 if (self.total_discounts.nil?)
      self.total_price = self.subtotal_price - self.total_discounts
      self.save()
    end
    return
  end
end
