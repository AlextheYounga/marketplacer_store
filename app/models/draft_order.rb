class DraftOrder < ApplicationRecord
  validates :cart_token, presence: true
  before_save :calculate_prices

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
    if (self.draft_order_lines.none?)
      # If no line_items, reset.
      self.subtotal_price = 0
      self.total_discounts = 0
      self.total_price = 0
      self.promotion_id = nil
      return self
    end

    line_items = self.draft_order_lines
    subtotal = line_items.map { |line| line.price }.sum

    self.subtotal_price = subtotal

    if (self.promotion_id)
      self.total_discounts = Promotion.calculate_discount(self)
      self.promotion_id = nil if (self.total_discounts == 0)
    end

    self.total_price = self.subtotal_price - self.total_discounts

    self
  end
end
