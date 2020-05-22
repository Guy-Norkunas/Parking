Rails.application.routes.draw do
  #routes for devise

  devise_for :users
  
  #routes for homepage

  root to: "home#index"
  get '/home', to: "home#index", as: "home"

  #routes for listings

  get '/manage', to:  "listing#index", as: "manage"
  get '/new', to: "listing#new", as: "new_listing"
  post '/new', to: "listing#create"

  get '/listing/:id', to: "listing#show", as: "listing"

  get '/edit/:id', to: "listing#edit", as: "edit_listing"
  patch '/listing/:id', to: "listing#update"

  delete '/listing/:id', to: "listing#delete", as: "delete_listing"

  #routes for comments

  post '/listing/:id', to: "review#create", as: "new_review"
  get '/listing/:id/:reviewid', to: "review#edit", as: "edit_review"
  patch 'listing/:id/:reviewid', to: "review#update", as: "update_review"
  delete 'listing/:id/:reviewid', to: "review#destroy", as: "destroy_review"

  #routes for bookings

  post '/payment/:id', to: "booking#payments", as: "payment"
  get '/payment/:id', to: "booking#index", as: "get_payment"

end