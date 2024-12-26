class PhotosController < ApplicationController
  def index
    @photos = Photo.includes(images_attachments: :blob).page(params[:page]).per(12)
  end

  def show
    @photo = Photo.find(params[:id])
    @next_photo = Photo.where("id > ?", @photo.id).order(:id).first
    @previous_photo = Photo.where("id < ?", @photo.id).order(id: :desc).first
  rescue ActiveRecord::RecordNotFound
    redirect_to photos_path, alert: 'Photo not found.'
  end
end
