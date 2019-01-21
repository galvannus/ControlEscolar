Rails.application.routes.draw do
  get 'subjectscore/new'

  get 'subjectscore/create'

  resources :studentsubjects
  resources :recordpayments
  resources :partials
  resources :scores
  resources :semesters
  resources :debts
  resources :groups
  resources :subjects
  resources :accounts
  resources :students
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'main#index'
  end

  unauthenticated :user do
    root 'main#unauthenticated'
  end

  get '/asignar' => 'students#assigment'
  post '/asignar' => 'students#assigment'
  get '/panel' => 'students#panelcontrol'
  post '/panel' => 'students#panelcontrol'

end
