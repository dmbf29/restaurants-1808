class RestaurantsController < ApplicationController
  # '/restaurants'
  def index
    @restaurants = Restaurant.all
  end

  # '/restaurants/1'
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # '/restaurants/new'
  def new
    # just for the form
    @restaurant = Restaurant.new
  end

  # we cant get here by a link. we have to submit the form
  # no view for this, this redirects to another page
  def create
    # create an instance of a restaurant
    # try to save it
    # if it saves... go to the show page
    # if it doesnt save... show the form again
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # make a seperate request to go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      # show the new.html.erb (but with the @restaurant we just tried to create)
      render 'new', status: :unprocessable_entity # 422
    end
  end

  # '/restaurants/1/edit'
  def edit
    # just for the form
    @restaurant = Restaurant.find(params[:id])
  end

  # we cant get here by a link. we have to submit the form
  # no view for this, this redirects to another page
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      # show the edit.html.erb (but with the @restaurant we just tried to update)
      render 'edit', status: :unprocessable_entity # 422
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other # redirect
  end

  private

  def restaurant_params
    # whitelists the attributes a user can give in the form (for security)
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
