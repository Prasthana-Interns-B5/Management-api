Rails.application.routes.draw do
  get 'feedbacks/index'
  get 'feedbacks/show'
  get 'feedbacks/create'
  get 'feedbacks/update'
  get 'feedbacks/destroy'
  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations" }


  resources :employees do
    get "subordinates", on: :member
    get "queries", on: :member
    get "scores", on: :member
    get "managers", on: :collection
    put "role", on: :member

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
end


