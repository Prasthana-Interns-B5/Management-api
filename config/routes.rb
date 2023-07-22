
Rails.application.routes.draw do

  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations"}

    devise_scope :employee do
      post '/employees/create_first_employee', to: 'employees/registrations#create_first_employee'
      post '/employees/generate_otp', to: 'employees/sessions#generate_otp'
    end
  

    resources :employees do
      get "subordinates", on: :collection
      get "queries", on: :member
      get "scores", on: :member
      get "reviews", on: :member
      get "current_employee_info", on: :collection
    end
      

  resources :questions do
    get "replies", on: :member
  end

  resources :answers
  resources :home_page 
  resources :reference_data



  resources :points do
    put "manager_score", on: :member
  end

  resources :feedbacks do
    get "get_individual_feedback", on: :member 
    get "get_individual_feedback_type", on: :collection
    get "get_month_based_records", on: :collection
    get "flag_based_records",on: :collection
  end


  resources :one_on_one do
    get "meetings", on: :collection
    get "reviews", on: :member
    get "rating", on: :member
  end

  resources :reviews do
    get 'find_by_type', on: :collection
    get "comments", on: :member
  end

  resources :comments

end


