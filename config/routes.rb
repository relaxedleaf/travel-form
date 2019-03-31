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
end
