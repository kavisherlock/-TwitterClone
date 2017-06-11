class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:notice] = 'Please log in.'
        redirect_to login_path, notice: 'Please log in.'
      end
    end
    
end
