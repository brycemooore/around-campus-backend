class ConversationSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :sender, foreign_key: :sender_id
  belongs_to :recipient, foreign_key: :recipient_id
  has_many :messages
end
