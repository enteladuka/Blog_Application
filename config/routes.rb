Rails.application.routes.draw do
root 'posts#index', as: 'home' #posts controller / index action

get 'users/new'

get 'about' => 'pages#about'#pages controller / about action

get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'

resources :users
resources :posts do#defines all of the routs for controller posts
  resources :comments

end
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
