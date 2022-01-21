class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :uuid
      t.string :name
      t.decimal :price, precision: 64, scale: 12
      t.string :product_image
      t.timestamps
    end
  end
end
