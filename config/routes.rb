Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: "employees/sessions",
    registrations: "employees/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :employees do
    get "subordinates", on: :member
    get "queries", on: :member
    get "reviews", on: :member
  end

  resources :questions do
    get "replies", on: :member
  end

  resources :answers
end
