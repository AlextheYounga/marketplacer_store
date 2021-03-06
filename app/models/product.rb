class Product < ApplicationRecord
  has_many :draft_order_line
  
  validates :uuid, presence: true
  validates :name, presence: true

  class << self
    def import
      products_file = File.read("storage/products.json")
      products = JSON.parse(products_file)

      products.each do |row|
        self.create_or_find_by(uuid: row["uuid"]) do |product|
          product.name = row["name"]
          product.price = row["price"]
          product.product_image = row["product_image"]
        end
      end
    end
  end
end
