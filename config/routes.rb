Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'courses#index'
    get 'home', to: 'pages#home'
    get 'about', to: 'pages#about'
    get 'courses/new', to: 'courses#new'
    get 'login', to: 'logins#new'
    post 'login', to: 'logins#create'
    delete 'login', to: 'logins#destroy'

    resources :courses, except: [:new]
    resources :students

end
