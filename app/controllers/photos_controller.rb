class PhotosController < ApplicationController
  def index
    @photos = Photo.includes(images_attachments: :blob).page(params[:page]).per(12)
  end

  def show
    @photo = Photo.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to photos_path, alert: 'Photo not found.'
  end
end
