Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :create] do
      collection do
        get 'filter'
      end
    end
  end
end
