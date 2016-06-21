Rails.application.routes.draw do

  #RESTful routes for the following resources
  resources :artists

  #this is my landing page
  root 'static_pages#home'

  #custom URL syntax example - REST verb, name of the URL that the user will enter, controller#action, name of path inside view layer known to your app
  get 'test', to: "static_pages#test", as: "test"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
