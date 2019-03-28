Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authorization_forms
  resources :departments
  resources :employees
  resources :expense_types
  resources :receipts
  resources :reimbursement_forms
  resources :requests
  resources :statuses
  resources :trips
  resources :wishes
end
