Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'courses#index'
    get 'home', to: 'pages#home'
    get 'about', to: 'pages#about'
    get 'courses/new', to: 'courses#new'

    resources :courses, except: [:new]
    resources :students

end
