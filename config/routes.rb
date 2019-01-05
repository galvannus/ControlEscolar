Rails.application.routes.draw do
  resources :partials
  resources :scores
  resources :semesters
  resources :debts
  resources :groups
  resources :subjects
  resources :accounts
  resources :students
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'main#index'
  end

  unauthenticated :user do
    root 'main#unauthenticated'
  end

  get '/asignar' => 'students#assigment'
  post '/asignar' => 'students#assigment'
end
