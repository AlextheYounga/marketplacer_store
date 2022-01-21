class ProductsController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :import_products, only: [:index, :show]

  def index
    @products = Product.all
  end

  def show
  end

  private

  def set_article
    @product = Product.find(params[:id])
  end

  def import_products
    if Rails.env.development?
      Product.import if (!Product.any?) #Import products from file if none exist in database; display purposes only.
    end
  end
end
