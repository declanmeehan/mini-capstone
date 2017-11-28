Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do
    post "/users" => "users#create"
    get "/products" => "products#index"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    get "/products/:id" => "products#show"
    delete "products/:id" => "products#destory"
  end
end
