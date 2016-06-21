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
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render"new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  #this defines which model and what attributes are permitted to be changed/created via request (i.e., a user )
  def artist_params
    params.require(:artist).permit(:name, :image_link, :biography)
  end

  #DRY principle. This is used by muliple actions, so write it once
  def get_artist
    Artist.find(params[:id])
  end

end
