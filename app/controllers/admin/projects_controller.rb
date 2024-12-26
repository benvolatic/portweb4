module Admin
    class ProjectsController < BaseController
      def index
        @projects = Project.all
      end

      def show
        @photo = Photo.find(params[:id])
      end
  
      def new
        @project = Project.new
      end
  
      def create
        @project = Project.new(project_params)
        if @project.save
          redirect_to admin_dashboard_path, notice: 'Project added successfully.'
        else
          render :new, status: :unprocessable_entity
        end
      end
  
      def edit
        @project = Project.find(params[:id])
      end
  
      def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
          redirect_to admin_dashboard_path, notice: 'Project updated successfully.'
        else
          render :edit, status: :unprocessable_entity
        end
      end
  
      def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to admin_dashboard_path, notice: 'Project deleted successfully.', status: :see_other
      end
  
      private
  
      def project_params
        params.require(:project).permit(:title, :description, :url)
      end
    end
  end
  