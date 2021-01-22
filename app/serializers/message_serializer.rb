class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :conversation_id, :user_id
  belongs_to :user
end
