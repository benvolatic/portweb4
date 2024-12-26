module Admin
    class SessionsController < BaseController
      skip_before_action :authenticate_admin!, only: [:new, :create]
      
      def new
        # Render the login form
      end
  
      def create
        admin = AdminUser.find_by(email: params[:email])
        if admin&.authenticate(params[:password])
          session[:admin_user_id] = admin.id
          redirect_to admin_dashboard_path, notice: 'Logged in successfully'
        else
          flash.now[:alert] = 'Invalid email or password'
          render :new, status: :unprocessable_entity
        end
      end
  
      def destroy
        session[:admin_user_id] = nil
        redirect_to new_admin_session_path, notice: 'Logged out successfully'
      end
    end
  end
  