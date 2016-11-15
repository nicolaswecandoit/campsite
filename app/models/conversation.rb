class Conversation < ApplicationRecord
 belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
 belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
 
 belongs_to :user
  has_many :users, through: :messages

 
has_many :messages, dependent: :destroy

has_many :campings, through: :users



validates_uniqueness_of :sender_id, :scope => :recipient_id
scope :between, -> (sender_id,recipient_id) do
 where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
 end
 
 def message_time
  created_at.strftime("%m/%d/%y at %l:%M %p")
 end

end