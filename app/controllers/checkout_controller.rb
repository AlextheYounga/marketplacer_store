class CheckoutController < ApplicationController
  before_action :import_products, only: [:cart]

  def cart
  end

  def add
    @order = DraftOrder.find_or_initialize_by(cart_token: cookies[:anon_shopping])
    if (@order.save)
      product Product.find_by_id(params.fetch(:product_id))
      @order.draft_order_lines.create(
        product_id: product.id,
        quantity: 1, #Don't have a fully fleshed out quantity system yet.
        price: product.price,
      )
    end
  end

  def check_discount_code
  end

  private

  def import_promotions
    if Rails.env.development?
      Promotion.import if (!Promotion.any?) #Import products from file if none exist in database; display purposes only.
    end
  end
end
