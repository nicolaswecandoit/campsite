class MessagesController < ApplicationController
 before_action :authenticate_user!
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
def index
 
 @messages = @conversation.messages
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end
 if @messages.last
  if @messages.last.user_id != current_user.id
   @messages.last.read = true;
  end
 end
@message = @conversation.messages.new
 end
def new
 @message = @conversation.messages.new
end
def create
 @message = @conversation.messages.new(message_params)
 if @message.save
  
  #ne fonctionne pas et créé une notification pour tous les messages et non par user. A revoir
  
  usercourant = User.find(current_user.id) 
(@conversation.users.uniq - [usercourant]).each do |user|
  
 # user = User.find(user.id) 
 # users = User.find(current_user.id)
  Notification.create(recipient: user, actor: current_user, action: "a répondu", notifiable: @conversation)
 end
  
  SendMessageMailer.new_message(@message).deliver_later
  redirect_to conversation_messages_path(@conversation)
 end
end
private
 def message_params
  params.require(:message).permit(:body, :user_id)
 end
end