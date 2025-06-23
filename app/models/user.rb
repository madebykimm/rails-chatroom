class User < ApplicationRecord
  has_many :messages
  validates :username, presence: true, uniqueness: true
end

class ChatRoom < ApplicationRecord
  has_many :messages
  validates :name, presence: true
end

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates :content, presence: true
end
