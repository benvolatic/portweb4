class ProjectsController < ApplicationController
  def index
    @projects = Project.all # This assumes a Project model exists
  end
end
