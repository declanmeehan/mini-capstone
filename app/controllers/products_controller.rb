class ProductsController < ApplicationController

  def products_all_method
    render json: Product.all.to_json
  end

  def products_1_method
    render json: Product.first.to_json
  end

  def products_2_method
    render json: Product.second.to_json
  end

  def products_3_method
    render json: Product.third.to_json
  end

end
