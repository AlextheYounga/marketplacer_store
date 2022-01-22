class Promotion < ApplicationRecord
  belongs_to :order
  #   enum price_rule_id: { tenoff: 0, fifteenoff: 1, twentyoff: 2 }

  def calculate_discount(order_id, discount_code)
    draft_order = DraftOrder.find_by_id(order_id)
    promotion = self.where(:discount_code => draft_order.discount_code).first
    if (promotion)
      draft_order.discount_code = discount_code

      if (draft_order.total_price > promotion.price_floor)
        draft_order.total_discounts = (draft_order.total_price * promotion.discount_amount)
        draft_order.total_price = (draft_order.total_price - draft_order.total_discounts)
      end
    else
      draft_order.discount_code = nil
    end
    draft_order.save()
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
