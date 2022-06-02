class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.all
    end
  end

  def show
    if @current_user
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
    else
      flash["notice"] = "You must be logged in."
    end
    redirect_to "/login"
  end

  def new
      @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place.save
    end  
    redirect_to "/places"
  end

end
