class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Account successfully created!"
            redirect_to blogs_url
        else
            render "new"
        end
    end

    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end
