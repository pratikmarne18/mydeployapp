class HomesController < ApplicationController

  def index
    @all_images = Image.last(25).reverse  
  end
  
end
