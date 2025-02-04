module Admin
  class ResumesController < BaseController
    before_action :set_resume, only: [:destroy, :set_current]

    def index
      @resumes = Resume.all
    end

    def create
      @resume = Resume.new(resume_params)
      if @resume.save
        redirect_to admin_resumes_path, notice: 'Resume uploaded successfully.'
      else
        redirect_to admin_resumes_path, alert: 'Failed to upload resume.'
      end
    end

    def destroy
      @resume.file.purge # Deletes the attached file
      @resume.destroy
      redirect_to admin_resumes_path, notice: 'Resume deleted successfully.'
    end

    def set_current
      Resume.update_all(current: false) # Clear the previous current resume
      @resume.update(current: true)
      redirect_to admin_resumes_path, notice: 'Current resume updated.'
    end

    private

    def set_resume
      @resume = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:file)
    end
  end
end
