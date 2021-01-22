class ConversationsController < ApplicationController

    def index 
        render json: current_user.sender_conversations + current_user.recipient_conversations, status: :ok
    end

    def show 
        if current_user.id == params[:id].to_i
            render status: :not_acceptable
        else  
            convo = Conversation.where(sender_id: current_user.id, recipient_id: params[:id]).or(Conversation.where(recipient_id: current_user.id, sender_id: params[:id]))
            if convo.any?
                render json: convo, status: :ok
            else 
                convo = Conversation.create(sender_id: current_user.id, recipient_id: params[:id])
                render json: [convo], status: :ok
            end
        end
    end
end
