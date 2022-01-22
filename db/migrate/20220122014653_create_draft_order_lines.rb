class CreateDraftOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :draft_order_lines do |t|
      t.references :draft_order, index: true
      t.references :product, index: true
      t.string :name
      t.string :title
      t.decimal :price, precision: 64, scale: 12
      t.integer :quantity
      # t.float :weight
      # t.string :weight_unit
      # t.boolean :requires_shipping
      # t.boolean :taxable, defaults: true
      # t.reference :product_variant, index: true
      # t.boolean :gift_card
      # t.string :sku
      t.timestamps
    end
  end
end
