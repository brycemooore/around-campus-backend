class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user = User.find(params[:user_id])
    stream_from "instachat" + current_user.id.to_s
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
