class ProductsController < ApplicationController
  def index
    Product.import if (!Product.any?) #Import products from file if none exist in database; display purposes only.
    @products = Product.all
  end
end
