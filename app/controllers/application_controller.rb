class ApplicationController < ActionController::Base
    def current_user
        session[:user_id] = user.id
      end
    
    def logged_in
        current_user
    end
end
