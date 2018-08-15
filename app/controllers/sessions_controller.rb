class SessionsController < ApplicationController
    def new
    end

    def create
        
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to  @user
        else
            render '/sessions/new', :notice => "Username/email/password incorrect or can't be blank"
        end

        # @user = User.find_or_create_by(uid: auth['uid']) do |u| 
        #     u.username = auth['info']['username']
        #     u.email = auth['info']['email']
        #     u.password = auth['info']['password']
        # end
        # session[:user_id] = @user.id
        # redirect_to @user
    end

    def destroy
        
        session.delete :user_id
        
        redirect_to root_path
    end

    # private

    # def auth
    #     request.env['omniauth.auth']
    # end

end
