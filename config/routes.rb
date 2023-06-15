Rails.application.routes.draw do
  get '/health', to: proc { [200, {}, ['']] }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api' do
    resources :articles, only: [:create, :show, :update, :destroy]
    post 'users', to: 'users#create'
    post 'users/login', to: 'authentication#create'
  end


end
