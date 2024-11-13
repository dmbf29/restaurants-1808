Rails.application.routes.draw do
  # Prefix ONLY refers to the path (doesnt include http verb)
  # VERB '/path', to: 'controller#action', as: :prefix
  # resources is ONLY for CRUD routes
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end

# restaurants_path
# restaurants_path, method: :post

# Non-CRUD routes (index, show, new, create, edit, update, destroy)
# collection -> all of the restaurants (aka no id)
# member     -> specific restaurant (aka need the id)
#  do
#   collection do
#     get :top
#   end
#   member do
#     get :chef
#     patch :upvote
#   end
# end

# get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
