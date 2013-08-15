SocialThingamajig::Application.routes.draw do
 resources :posts, :except => [:index, :show]
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :friend_circles
end