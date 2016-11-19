Rails.application.routes.draw do
  resources :trainers
  resources :tasks
  post '/trainers/check/:id', to: 'trainers#check', as: 'trainers_check'
  get '/', to: 'trainers#index', as: 'menu_path'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
