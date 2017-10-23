Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'go_chatting', to: 'home#go_chatting'
  get 'new_chat', to: 'home#new_chat'
  post 'send_new_chat', to: 'home#send_new_chat'
  root :to =>'home#index'
end
