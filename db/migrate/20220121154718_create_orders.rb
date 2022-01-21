class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|

      t.timestamps
    end
  end
end

id
billing_address_id ➤ CUSTOMER_ADDRESS
customer_id ➤ CUSTOMER
location_id ➤ LOCATION
browser_ip
buyer_accepts_marketing
cancel_reason
cancelled_at
closed_at
cart_token
checkout_token
created_at
currency
email
financial_status
landing_site_base_url
name
note
number
order_number
processed_at
processing_method
referring_site
source_name
subtotal_price
taxes_included
total_discounts
total_line_items_price
total_price
total_tax
total_weight
updated_at
shipping_address_*