Rails.application.routes.draw do

  #all CRUD actions with resources
  resources :artists

  #sets home_page
  root 'static_pages#home'

  #request type, URL name, controller#action, give it a special path name, i.e. test_path
  get '/test', to: "static_pages#test", as: 'test'
  get '/about', to: "static_pages#about", as: 'about'
  
end
