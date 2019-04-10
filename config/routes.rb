Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "trips#index"
  resources :authorization_forms
  resources :departments
  resources :expense_types
  resources :receipts
  resources :reimbursement_forms
  resources :requests
  resources :statuses
  resources :trips
  resources :wishes
  
  get 'manage/authform/pending', to: 'manages#authform_index'
  get 'manage/authform/history', to: 'manages#authform_history', as: :manage_auth_history
  get 'manage/authform/:id', to: 'manages#authform_show', as: :manage_auth
  put 'manage/authform/:id', to: 'manages#authform_update', as: :manage_auth_update

  get 'manage/reimform/pending', to: 'manages#reimform_index'
  get 'manage/reimform/history', to: 'manages#reimform_history', as: :manage_reimform_history
  get 'manage/reimform/:id', to: 'manages#reimform_show', as: :manage_reimform
  put 'manage/reimform/:id', to: 'manages#reimform_update', as: :manage_reimform_update
  
  get 'routes', to: 'pages#routes'
  get 'dashboard', to: 'pages#dashboard'
  get 'footstep', to: 'pages#footstep'
  
  namespace :api do
    get 'destination', to: 'pages#getdestination'
  end
end
