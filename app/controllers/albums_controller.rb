class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  
  
  def index
    @albums = Album.where('user_id =?', current_user.id)
  end

  def new
    @album = Album.new
  end
  
  def create
    album = Album.new(album_params)
    if album.save
      flash[:success] = 'Album created successfully'
      redirect_to albums_path
    else
      flash[:danger] = 'Something went wrong. Please try again.'
      render :new
    end
  end
  
  def all_images
    @album = Album.find(params[:id])
    @images = @album.images
  end
  
  def all_album
    @albums = Album.all
  end
  
  private
  def album_params
    params.require(:album).permit(:name, :user_id, :_destroy,:images_attributes => [:name, :tag_line, :image, :album_id, :_destroy])
  end
end
