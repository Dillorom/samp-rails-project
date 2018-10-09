class UsersController < ApplicationController
    before_action :logged_in, only: [ :index, :show, :edit]
   
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        #binding.pry
        @user = User.find(params[:id])
        render json: @user, status: 200
    end
    
    def create 
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    # def destroy
    #     @user = User.find(params[:id])
    #     @user.delete
    #     redirect_to root_path
    # end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :admin, :uid, :provider, :oauth_token, :oauth_expires_at, :image)
    end

    def set_auth
        @auth = session[:omniauth] if session[:omniauth]
    end

end
