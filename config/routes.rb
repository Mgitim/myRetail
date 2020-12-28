Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    # prefix everyting in here with /api/
    namespace :v1 do
      resources :products, only: [:show, :update]
    end
  end
end
