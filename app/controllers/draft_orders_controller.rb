class OrdersController < ApplicationController
  def create
    @order = DraftOrder.new(order_params)
    @order.cart_token = cookies[:anon_shopping]
    @line_items = @order.draft_order_lines.new(line_item_params)
    # Calculate Prices
    @line_items = DraftOrderLine.calculate_prices(@line_items)
    @order = DraftOrder.calculate_prices(@order, @line_items)
  end

  private

  def order_params
    params.permit(
      :order_number,
      :promotion,
      :cart_token,
      :name,
      :email,
      :currency,
      :subtotal_price,
      :total_discounts,
      :total_price,
    )
  end

  def line_item_params
    params.permit(
      :draft_order,
      :product_id,
      :name,
      :title,
      :price,
      :quantity,
    )
  end
end
