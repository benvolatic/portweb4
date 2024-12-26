class ApplicationController < ActionController::Base
  helper_method :current_admin, :admin_signed_in?

  private

  def current_admin
    @current_admin ||= AdminUser.find_by(id: session[:admin_user_id])
  end

  def admin_signed_in?
    current_admin.present?
  end
end
