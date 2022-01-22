class CheckoutController < ApplicationController
  before_action :import_promotions, only: [:cart]

  def cart
    @order = DraftOrder.where(cart_token: cookies[:anon_shopping]).first
  end

  def add
    @order = DraftOrder.find_or_create_by(cart_token: cookies[:anon_shopping])

    product = Product.find_by_id(params.fetch(:id))
    DraftOrderLine.generate_line_items(@order, product)

    @order.generate_order_number()
    @order.calculate_prices()

    redirect_to cart_path
  end

  def check_discount_code
    Promotion.calculate_discount(
      params.fetch(:order_id),
      params.fetch(:discount_code)
    )
    redirect_to cart_path
  end

  private

  def import_promotions
    if Rails.env.development?
      Promotion.import if (!Promotion.any?) #Import promotions from file if none exist in database; display purposes only.
    end
  end
end
