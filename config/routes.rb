Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations" }


  resources :employees do
    get "subordinates", on: :member
    get "queries", on: :member
    get "scores", on: :member
    get "managers", on: :collection
  end

  resources :questions do
    get "replies", on: :member
  end

  resources :answers

  resources :points do
    put "manager_score", on: :member
  end
end
