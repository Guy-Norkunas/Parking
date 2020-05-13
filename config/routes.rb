Rails.application.routes.draw do
  root to: "home#index"
  get 'home', to: "home#index", as: "home"
  get 'new', to: "listing#new", as: "new_listing"
  post 'new', to: "listing#create"
end