Rails.application.routes.draw do
  namespace :v1 do
    get "/products" => "products#index"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    get "/products/:id" => "products#show"
    delete "products/:id" => "products#destory"
  end
end
