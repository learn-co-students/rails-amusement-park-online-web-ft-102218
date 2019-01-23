class RidesController < ApplicationController
  def ride
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    ride = ride.take_ride
    if ride.class == String
      flash[:notice] = ride
    else
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to user_path(@user)
  end
end
