
Rails.application.routes.draw do
  get 'ratings/reviews'

  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations"}

    devise_scope :employee do
      post '/employees/create_first_employee', to: 'employees/registrations#create_first_employee'
      post '/employees/generate_otp', to: 'employees/sessions#generate_otp'
    end
  

    resources :employees do
      get "subordinates", on: :member
      get "queries", on: :member
      get "scores", on: :member
      put "role", on: :member
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
    put "manager_feedback", on: :member 
    put "comments", on: :member
  end


  resources :one_on_one do
    get "meetings", on: :collection
  end
  
  resources :reviews do
    get 'find_by_type', on: :collection
  end

  resources :ratings
  
end


