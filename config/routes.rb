Rails.application.routes.draw do
  # Prefix ONLY refers to the path (doesnt include http verb)
  # VERB '/path', to: 'controller#action', as: :prefix

  # See all restaurants -> index
  get '/restaurants', to: 'restaurants#index', as: :restaurants
  # Create a restaurant
  # 1. just a page for the form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # 2. a place to send the form (aka create the restaurant)
  post '/restaurants', to: 'restaurants#create'

  # See details about one restaurant
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Update a restaurant
  # 1. just a page for the form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # 2. a place to send the form (aka update the restaurant)
  patch '/restaurants/:id', to: 'restaurants#update'

  # Destroy a restaurant
  delete '/restaurants/:id', to: 'restaurants#destroy'
end

# restaurants_path
# restaurants_path, method: :post
