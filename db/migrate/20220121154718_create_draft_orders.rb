class CreateDraftOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :draft_orders do |t|
      t.string :order_number
      t.integer :customer_id
      t.integer :billing_address_id
      t.references :promotion
      t.string :cart_token
      t.string :checkout_token
      t.string :name
      t.string :email
      t.string :phone
      t.text :note
      t.string :browser_ip
      t.boolean :accepts_marketing
      t.string :currency
      t.decimal :subtotal_price, precision: 64, scale: 12
      t.decimal :taxes_included, precision: 64, scale: 12
      t.decimal :total_discounts, precision: 64, scale: 12
      t.decimal :total_line_items_price, precision: 64, scale: 12
      t.decimal :total_price, precision: 64, scale: 12
      t.decimal :total_tax, precision: 64, scale: 12
      t.decimal :total_weight, precision: 64, scale: 12
      t.timestamps
    end
  end
end
