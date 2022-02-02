Rails.application.routes.draw do

  namespace :bunsenbako do
    get '/',      to: 'top#index'
    get 'index',  to: 'top#index'
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
