class UsersController < ApplicationController

    skip_before_action :authenticate_user, only: [:create]

    def create
        user = User.new(user_params)
        if user.save!
            render json: user, status: :ok
        else 
            render json: user.errors, status: :fail
        end 
    end 


    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end 
end
