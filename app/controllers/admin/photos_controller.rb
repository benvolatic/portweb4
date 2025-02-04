module Admin
  class PhotosController < BaseController
    before_action :set_photo, only: %i[show edit update destroy]

    def index
      @photos = Photo.with_attached_images.page(params[:page]).per(10)
    end

    def new
      @photo = Photo.new
    end

    def create
      if params[:photo][:images].present?
        # Filter out any blank strings from the images array
        images = params[:photo][:images].reject(&:blank?)
    
        images.each do |image|
          # Create a new Photo record for each image
          photo = Photo.new(
            title: "#{params[:photo][:title]} - #{image.original_filename}",
            description: params[:photo][:description]
          )
          photo.images.attach(image)
          if photo.save
            Rails.logger.info "Photo with ID #{photo.id} created successfully."
          else
            Rails.logger.error "Failed to create photo: #{photo.errors.full_messages.join(', ')}"
          end
        end
        redirect_to admin_dashboard_path, notice: 'Photo(s) added successfully.'
      else
        @photo = Photo.new(photo_params)
        flash.now[:alert] = 'Please upload at least one image.'
        render :new, status: :unprocessable_entity
      end
    end
    
    

    def show
      @photo = Photo.find(params[:id])
      @next_photo = Photo.where("id > ?", @photo.id).order(:id).first
      @previous_photo = Photo.where("id < ?", @photo.id).order(id: :desc).first
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_photos_path, alert: 'Photo not found.'
    end
    

    def edit; end

    def update
      if @photo.update(photo_params)
        redirect_to admin_dashboard_path, notice: 'Photo updated successfully.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @photo = Photo.find(params[:id])
      Rails.logger.debug "Destroying photo: #{@photo.inspect}"
      @photo.destroy
      redirect_to admin_photos_path, notice: 'Photo was successfully deleted.', status: :see_other
    end

    private

    def set_photo
      @photo = Photo.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_photos_path, alert: 'Photo not found.'
    end

    def photo_params
      params.require(:photo).permit(:title, :description, images: [])
    end
  end
end
