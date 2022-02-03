Rails.application.routes.draw do

  get 'users/show'
  root          to: 'top#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
}
#devise_forのルーティングのままだとログアウトできない
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
