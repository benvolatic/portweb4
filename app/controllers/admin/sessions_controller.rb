module Admin
class SessionsController < BaseController
    skip_before_action :authenticate_admin!, only: [:new, :create]
    
    def new
    # Render the login form
    end

    def create
        Rails.logger.debug "Login attempt with params: #{params.inspect}"
        admin = AdminUser.find_by(email: params[:email])
        if admin&.authenticate(params[:password])
          Rails.logger.debug "Login successful for admin: #{admin.email}"
          session[:admin_user_id] = admin.id
          redirect_to admin_dashboard_path, notice: 'Logged in successfully'
        else
          Rails.logger.debug "Login failed for email: #{params[:email]}"
          flash.now[:alert] = 'Invalid email or password'
          render :new, status: :unprocessable_entity
        end
      end
      

    def destroy
    session[:admin_user_id] = nil
    redirect_to admin_login_path, notice: 'Logged out successfully'
    end
end
end
