class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = get_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    binding.pry
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render 'new' #render page again and tell user what's wrong
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  #defines which model and what attributes are permitted to be changed/created via a request (i.e. by the user)
  def artist_params
    params.require(:artist).permit(:name, :image_link, :bio)
  end

  #DRY principle. This is used by multiple actions, so write it once
  def get_artist
    Artist.find(params[:id])
  end

end
