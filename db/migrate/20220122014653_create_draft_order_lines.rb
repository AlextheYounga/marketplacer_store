class CreateDraftOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :draft_order_lines do |t|
      t.references :draft_order, index: true
      t.references :product, index: true
      t.references :promotions
      # t.reference :product_variant, index: true
      t.boolean :gift_card
      t.float :weight
      t.string :weight_unit
      t.string :name
      t.string :title
      t.decimal :price, precision: 64, scale: 12
      t.decimal :applied_discount, precision: 64, scale: 12
      t.integer :quantity
      t.boolean :requires_shipping
      t.string :sku
      t.boolean :taxable
      t.timestamps
    end
  end
end