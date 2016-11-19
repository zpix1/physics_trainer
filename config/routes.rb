Rails.application.routes.draw do
  resources :trainers
  resources :tasks
  post '/trainers/check/:id', to: 'trainers#check', as: 'trainers_check'

  get '/', to: 'trainers#index', as: 'menu_path'
  get '/show_mix', to: 'trainers#mix_show', as: 'show_mix'
  post '/check_mix', to: 'trainers#mix_check', as: 'check_mix'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
