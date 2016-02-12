class ImagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    
  end
  
  def new
    @image = Image.new
    @album_id = params[:id]
    @album = Album.find(@album_id)
    @images = Image.where('album_id =?', @album_id)
  end
  
  def create
    @images_count_per_album = Image.where(:album_id => image_params['album_id']).count
    unless @images_count_per_album > 26    
      image = Image.new(image_params)
      if image.save
        flash[:success] = "Image Uploaded Successfully."
        redirect_to new_image_path(:id => image.album_id)
      else
        flash[:danger] = "Something went wrong while Uploading your Image."
        redirect_to new_image_path(:id => image.album_id)
      end
    else
      flash[:danger] = "Already 25 Images are Uploaded in album. Please upload in another Album."
      redirect_to albums_path
    end
  end
  
  def destroy
    Image.find(params[:id]).destroy
    flash[:success] = "Image deleted successfully."
    redirect_to new_image_path(:id => params[:album_id])
  end
  
  private
  def image_params
    params.require(:image).permit(:name, :tag_line, :image, :album_id)
  end
  
end
