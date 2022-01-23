class CartController < ApplicationController
  before_action :import_promotions, only: [:index]
  before_action :set_order, only: [:index, :check_discount_code]

  def index
  end

  def add
    product = Product.find_by_id(params.fetch(:id))
    @order = DraftOrder.find_or_create_by(cart_token: cookies[:anon_shopping]) #Setting up order under browser cookie.

    DraftOrderLine.generate_line_items(@order, product) #Build draft order line items.
    @order.generate_order_number() #Create unique order number

    @order.save

    redirect_to cart_index_path
  end

  def show
  end

  def destroy
    @line = DraftOrderLine.find_by_id(params[:id])
    @order = DraftOrder.find_by_id(@line.draft_order_id)
    @line.destroy
    @order.save()

    redirect_to cart_index_path
  end

  def check_discount_code
    Promotion.check_discount_code( # Will check price rules and add a promotion id if cart passes checks.
      @order,
      params.fetch(:code)
    )
    redirect_to cart_index_path
  end

  private

  def set_order
    @order = DraftOrder.where(cart_token: cookies[:anon_shopping]).first
  end

  def import_promotions
    if Rails.env.development?
      Promotion.import if (!Promotion.any?) #Import promotions from file if none exist in database; display purposes only.
    end
  end
end
