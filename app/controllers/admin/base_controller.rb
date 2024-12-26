module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin!

    private

    def authenticate_admin!
      redirect_to admin_login_path, alert: 'Please log in to access the admin dashboard.' unless admin_signed_in?
    end
  end
end
