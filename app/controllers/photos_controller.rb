class PhotosController < ApplicationController
  def index
    @photos = Photo.all # This assumes a Photo model exists
  end
end
