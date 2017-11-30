Rails.application.routes.draw do
  namespace :v1 do
    post 'orders' => 'orders#create'
    post 'user_token' => 'user_token#create'
    get '/orders' => 'orders#index'
    get 'orders' => 'orders#create'


    post "/users" => "users#create"

    get "/products" => "products#index"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    get "/products/:id" => "products#show"
    delete "products/:id" => "products#destory"
  end
end
