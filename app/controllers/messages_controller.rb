class MessagesController < ApplicationController

    def create
        message = Message.new(message_params)
        if message.save
            convo = message.conversation
            recipient = (convo.sender_id == current_user.id ? convo.recipient_id : convo.sender_id)
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
                MessageSerializer.new(message)
              ).serializable_hash
              ActionCable.server.broadcast("instachat" + recipient.to_s, serialized_data)
            render json: message, status: :ok
        else 
            render json: message.errors, status: :not_acceptable
        end 
    end 


    def message_params 
        params.require(:message).permit(:body, :user_id, :conversation_id)
    end
end
