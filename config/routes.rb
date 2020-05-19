Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resource :temp

  get '/home', to: "home#index", as: "home"


  get '/manage', to:  "listing#index", as: "manage"
  get '/new', to: "listing#new", as: "new_listing"
  post '/new', to: "listing#create"

  get '/listing/:id', to: "listing#show", as: "listing"

  get '/edit/:id', to: "listing#edit", as: "edit_listing"
  patch '/listing/:id', to: "listing#update"

  delete '/listing/:id', to: "listing#delete", as: "delete_listing"

  
end