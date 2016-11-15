class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # GET /conversations
  # GET /conversations.json
  def index
    @users = User.all
   
    #@campings = Camping.find(params[:id])
 
    # Restrict to conversations with at least one message and sort by last updated
    @conversations = Conversation.joins(:messages).distinct
   
    @camping = Camping.all
    
    @messages = Message.where(params[:id])
    
     #@u = Message.where(params(recipient[:id]))
     

  end

  # POST /conversations
  # POST /conversations.json
  def create
  if Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).present?
    @conversation = Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).first
    
   

    else
    @conversation = Conversation.create!(conversation_params)
  end

  redirect_to conversation_messages_path(@conversation)
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id, :user_id, :body) 
    end
end