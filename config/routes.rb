Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'posts#index', as: 'home' #posts controller / index action

get 'about' => 'pages#about'#pages controller / about action

resources :posts do#defines all of the routs for controller posts
  resources :comments
end
end
