class PhotosController < ApplicationController
  def index
    @photos = Photo.with_attached_images.page(params[:page]).per(6)
  end

  def show
    @photo = Photo.find(params[:id])
    @next_photo = Photo.where("id > ?", @photo.id).order(:id).first
    @previous_photo = Photo.where("id < ?", @photo.id).order(id: :desc).first
  rescue ActiveRecord::RecordNotFound
    redirect_to photos_path, alert: 'Photo not found.'
  end
end
