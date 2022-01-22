class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :discount_code
      t.float :discount_amount
      t.decimal :price_floor
      # t.integer :price_rule_id
      t.timestamps
    end
  end
end
