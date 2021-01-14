class User < ApplicationRecord

    belongs_to :school
    has_many :posts
    has_many :sender_conversations, class_name: "Conversation", foreign_key: :sender_id
    has_many :recipient_conversations, class_name: "Conversation", foreign_key: :recipient_id
    has_many :messages 
    has_many :messaged_users, through: :recipient_conversations, foreign_key: :recipient_id
    validates :email, :username, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true
  
    has_secure_password
  
    def full_name
      self.first_name + ' ' + self.last_name
    end 
    
end
