Rails.application.routes.draw do
  #devise_for :users
  root 'home#index'

  get '/dashboard' => 'dashboard#index'

  get '/products' =>  'products#index'

  delete '/remove_row' => 'products#destroy'


  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions',
        passwords: 'users/passwords'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
