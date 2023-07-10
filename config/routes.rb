
Rails.application.routes.draw do
  
  post '/employee_sign_up/create_first_employee', to: 'employee_sign_up#create_first_employee'
  post '/employee_sign_up/generate_otp', to: 'employee_sign_up#generate_otp'


  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations" }
    
    resources :employees do
      get "subordinates", on: :member
      get "queries", on: :member
      get "scores", on: :member
      get "managers", on: :collection
      put "role", on: :member
      get "reviews", on: :member
      get "test", on: :collection
    end
      

    resources :questions do
    get "replies", on: :member
  end

  resources :answers
  resources :home_page 



  resources :points do
    put "manager_score", on: :member
  end

  resources :feedbacks do
    put "manager_feedback", on: :member 
    put "comments", on: :member
  end
end


