Rails.application.routes.draw do

  get "/products_all" => "products#products_all_method"
  get "/products_1" => "products#products_1_method"
  get "/products_2" => "products#products_2_method"
  get "/products_3" => "products#products_3_method"
end
