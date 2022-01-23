class Promotion < ApplicationRecord
  has_many :orders
  #   enum price_rule_id: { tenoff: 0, fifteenoff: 1, twentyoff: 2 }

  class << self
    def check_discount_code(draft_order, discount_code)
      # Checks price rules and adds a promotion id to cart if cart passes.
      promotion = self.where(:discount_code => discount_code).first
      if (promotion.present?)
        if (draft_order.total_price > promotion.price_floor)
          draft_order.promotion_id = promotion.id # Setting promotion id to calculate price later.
          draft_order.save()
        end
      end
    end

    def calculate_discount(draft_order)
      # Calculates total discount amount
      total_discounts = 0
      if (draft_order.promotion_id.present?)
        promotion = self.find_by_id(draft_order.promotion_id)
        if (draft_order.total_price > promotion.price_floor) # Redundancy, double checking price floor.
          total_discounts = (draft_order.total_price * promotion.discount_amount)
        end
      end
      return total_discounts
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
