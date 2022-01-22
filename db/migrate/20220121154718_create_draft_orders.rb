class CreateDraftOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :draft_orders do |t|
      t.string :order_number
      t.string :cart_token
      t.references :promotion
      t.string :name
      t.string :email
      t.string :currency, defaults: "USD"
      t.decimal :subtotal_price, precision: 64, scale: 12, defaults: 0
      t.decimal :total_discounts, precision: 64, scale: 12, defaults: 0
      t.decimal :total_price, precision: 64, scale: 12, defaults: 0
      # t.boolean :accepts_marketing, defaults: false
      # t.decimal :taxes_included, precision: 64, scale: 12
      # t.decimal :total_tax, precision: 64, scale: 12
      # t.decimal :total_weight, precision: 64, scale: 12
      t.timestamps
    end
  end
end
