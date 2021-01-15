class UsersController < ApplicationController

    skip_before_action :authenticate_user, only: [:create]

    def create
        user = User.new(user_params)
        user.school_id = params[:school_id]
        if user.save
            token=encode_jwt({user_id: user.id, username: user.username})
            render json: {user: user, jwt: token}, status: :accepted
        else 
             byebug
            render json: user.errors, status: :not_acceptable
        end 
    end 

    def anything 
        byebug
        render json: "hello"
    end 


    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end 
end
