class SessionsController < ApplicationController
    
    def new
    end

    def create
        auth = request.env["omniauth.auth"]
        session[:omniauth] = auth.except('extra')
        @user = User.sign_in_from_omniauth(auth)
        session[:user_id] = @user.id
        render 'users/show', notice: "Signed In"
        
        # @user = User.find_by(email: params[:email]) #||@ user = User.from_omniauth(env["omniauth.auth"])
        # if @user && @user.authenticate(params[:password])
        #     session[:user_id] = @user.id 
        #     redirect_to  @user
        # else
        #     render '/sessions/new', :notice => "Username/email/password incorrect or can't be blank"
        # end

        # @user = User.find_or_create_by(uid: auth['uid']) do |u| 
        #     #binding.pry
        #     u.username = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.image = auth['info']['image']
        #     u.id = auth['extra']['raw_info']['id']
        # end
        # session[:user_id] = @user.id
        # render 'users/show'
    end

    def destroy
        session[:user_id] = nil
        session[:omniauth] = nil
        redirect_to root_url, notice: "Signed out"
        
        # session.delete :user_id
        
        # redirect_to root_path
    end

    # private

    # def auth
    #     request.env['omniauth.auth']
    # end

end
