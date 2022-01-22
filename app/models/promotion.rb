class Promotion < ApplicationRecord
  has_many :orders
  #   enum price_rule_id: { tenoff: 0, fifteenoff: 1, twentyoff: 2 }

  class << self
    def calculate_discount(draft_order, discount_code)
      return if (draft_order.promotion_id.present?)
      promotion = self.where(:discount_code => discount_code).first
      if (promotion.present? && (draft_order.total_price > promotion.price_floor))
        draft_order.promotion_id = promotion.id
        draft_order.total_discounts = (draft_order.total_price * promotion.discount_amount)
        draft_order.save()
        # draft_order.total_price = (draft_order.total_price - draft_order.total_discounts)
      end
    end

    def import
      promotions_file = File.read("storage/promotions.json")
      promotions = JSON.parse(promotions_file)

      promotions.each do |row|
        self.create_or_find_by(discount_code: row["discount_code"]) do |promotion|
          promotion.name = row["name"]
          promotion.discount_amount = row["discount_amount"]
          promotion.price_floor = row["price_floor"]
        end
      end
    end
  end
end
