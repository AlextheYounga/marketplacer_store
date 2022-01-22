class CheckoutController < ApplicationController
  before_action :import_promotions, only: [:cart]

  def cart
    @order = DraftOrder.where(cart_token: cookies[:anon_shopping]).first
  end

  def add
    @order = DraftOrder.find_or_initialize_by(cart_token: cookies[:anon_shopping])
    if (@order.save)
      product = Product.find_by_id(params.fetch(:id))
      @order.draft_order_lines.create(
        product_id: product.id,
        quantity: 1, #Don't have a fully fleshed out quantity system yet.
        price: product.price,
      )
    end
    @order.generate_order_number
    @order.calculate_prices

    render 'checkout/cart'
  end

  def check_discount_code
    Promotion.calculate_discount(
      params.fetch(:order_id),
      params.fetch(:discount_code)
    )
    render cart_path
  end

  private

  def import_promotions
    if Rails.env.development?
      Promotion.import if (!Promotion.any?) #Import promotions from file if none exist in database; display purposes only.
    end
  end
end
