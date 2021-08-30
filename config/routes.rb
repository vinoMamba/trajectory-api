Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # 编写路由
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
