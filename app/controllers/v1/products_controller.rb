class V1::ProductsController < ApplicationController

  def index 
    product = Product.all.order(:id => :asc)
    if [:search_name]
    product = Product.where('name ILIKE ?', "%#{params[:search_name]}%")
    elsif [:search_price]
     product = Product.where('price ILIKE ?', "%#{params[:search_price]}%")
    end
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image: params["image"],
      description: params["description"]
      )
    if product.save
    render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
  end

  def show
    product_id = params["id"].to_i 
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def update 
    product_id = params["id"].to_i 
    product = Product.find_by(id: product_id)
    product.name = params["name"]
    product.price = params["price"]
    product.image = params["image"]
    product.description = params["description"] 
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
     product_id = params["id"].to_i 
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "product has successfully been DESTROYED"}
  end
end
