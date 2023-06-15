Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api' do
    resources :articles, only: %i[create show update destroy]
    post 'users', to: 'users#create'
    post 'users/login', to: 'authentication#create'
  end
end
