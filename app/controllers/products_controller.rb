class ProductsController < ApplicationController

  def products_all_method
    render json: Product.all.to_json
  end

end
