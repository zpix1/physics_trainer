Rails.application.routes.draw do
  resources :trainers
  resources :tasks
  post '/trainers/check/:id', to: 'trainers#check'
  get '/', to: 'trainers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
