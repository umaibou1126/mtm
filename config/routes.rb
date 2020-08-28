Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'home#index'
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :menu, only: %i[index show create update destroy]
      post   'signup',  controller: :users,    action: :create
      post   'signin',  controller: :sessions, action: :create
      delete 'signin', controller: :sessions, action: :destroy
      post   'refresh', controller: :refresh, action: :create
    end
  end
end
