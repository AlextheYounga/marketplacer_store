class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.references :draft_order, index: true
      t.integer :price_rule_id
      t.string :discount_code
      t.string :name
      t.text :description
      t.float :discount_amount
      t.timestamps
    end
  end
end
