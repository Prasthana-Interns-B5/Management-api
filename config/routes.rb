Rails.application.routes.draw do

  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations" }

  resources :employees do
    get "subordinates", on: :member
    get "queries", on: :member
    get "scores", on: :member
    get "subordinates", on: :member
    get "reviews", on: :member
    get "current_employee_info", on: :collection
  end

  resources :questions do
    get "replies", on: :member
  end

  resources :answers


  resources :points do
    put "manager_score", on: :member
  end

  resources :feedbacks do
    put "manager_feedback", on: :member 
    put "comments", on: :member
  end


  resources :one_on_one do
    get "search", on: :collection
  end

end


