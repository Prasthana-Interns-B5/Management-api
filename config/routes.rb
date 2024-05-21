
Rails.application.routes.draw do
  use_doorkeeper do
    controllers tokens: 'oauth'
  end

  devise_for :users

  resources :users do
    post 'send_email_auth_code', on: :collection
    post 'verify_email_auth_code', on: :collection
  end

  resources :employees do
    get 'subordinates', on: :collection
    get 'queries', on: :member
    get 'scores', on: :member
    put 'role', on: :member
    get 'reviews', on: :member
    get 'current_employee_info', on: :collection
    get 'all_employees', on: :collection
    resources :one_on_one, only: :index
    resources :employee_points
  end

  resources :questions do
    get 'replies', on: :member
  end

  resources :answers
  resources :home_page
  resources :reference_data

  resources :feedbacks do
    get 'get_individual_feedback', on: :member 
    get 'get_individual_feedback_type', on: :collection
    get 'get_month_based_records', on: :collection
    get 'flag_based_records',on: :collection
  end


  resources :one_on_ones, except: :index do
    get 'meetings', on: :collection
    get 'reviews', on: :member
    get 'rating', on: :member
  end

  resources :reviews do
    get 'find_by_type', on: :collection
    get 'comments', on: :member
  end

  resources :comments

  resources :notifications do
    get 'send_notification', on: :collection
  end
end
