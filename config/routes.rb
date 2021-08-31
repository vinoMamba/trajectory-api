Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tokens/create'
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # 编写路由
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :tokens, only: [:create]
    end
  end
end
