module Admin
  class DashboardController < BaseController
    def index
      @photos = Photo.all
      @projects = Project.all
    end
  end
end
