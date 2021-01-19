class ConversationsController < ApplicationController

    def index 
        render json: current_user.sender_conversations + current_user.recipient_conversations, status: :ok
    end
end
