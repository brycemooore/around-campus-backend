class MessagesController < ApplicationController

    def create
        message = Message.new(message_params)
        if message.save
            render json: message, status: :ok
        else 
            render json: message.errors, status: :not_acceptable
        end 
    end 


    def message_params 
        params.require(:message).permit(:body, :user_id, :conversation_id)
    end
end
