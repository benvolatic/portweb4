class ResumesController < ApplicationController
    def show
      @current_resume = Resume.find_by(current: true)
    end
  end
  