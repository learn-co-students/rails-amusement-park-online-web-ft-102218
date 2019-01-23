class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @attraction = Attraction.new
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def new
    @user = User.find(session[:user_id])
    @attraction = Attraction.new
  end

  def edit
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
