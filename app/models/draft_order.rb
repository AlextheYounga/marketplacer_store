class DraftOrder < ApplicationRecord
  validates :cart_token, presence: true
  validates :name, presence: true
  after_save :order_number
  before_save :calculate_prices

  has_many :draft_order_lines
  has_many :promotions

  def order_number
    if (self.order_number.nil?)
      self.order_number = "INV000#{self.id}"
    end
  end

  def calculate_prices
    if (self.draft_order_lines.any?)
      line_items = self.draft_order_lines
      subtotal = line_items.map { |line| line.price }.sum
      self.subtotal_price = subtotal
      self.total_price = self.subtotal_price - self.total_discounts
    end
  end
end
