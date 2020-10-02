Rails.application.routes.draw do
  devise_for :ms_users
  resources :ms_publishers
  resources :tr_loans
  resources :ms_books
  resources :ms_members
 root 'ms_members#index'
  get :ms_members, to:'ms_members#index'
  get :ms_books, to:'ms_books#index'
  get :tr_loans, to:'tr_loans#index'
  get :ms_publishers, to:'ms_publishers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
