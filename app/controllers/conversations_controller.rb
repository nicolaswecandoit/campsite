class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # GET /conversations
  # GET /conversations.json
  def index
    @users = User.all

    # Restrict to conversations with at least one message and sort by last updated
    @conversations = Conversation.joins(:messages).uniq.order('updated_at DESC')
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
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
end