class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def create
        user = User.new(user_params)
        user.school_id = params[:school_id]
        if user.save
            token=encode_token({user_id: user.id})
            render json: {user: user, jwt: token}, status: :accepted
        else 
          render json: user.errors, status: :not_acceptable
        end 
    end 

    def get_current_user
        render json: current_user, status: :ok
    end 


    def user_params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end 
end
