class ConversationsController < ApplicationController
  def index
  end

  def create
    @conversation = Conversation.between(params[:sender_id], params[recipient_id])
    @conversation ||= Conversation.create!(conversation_params)
  end

  def show
  end
  private
  def conversation_params
    params.require(:converstaion).permit(:sender_id, recipient_id)
  end
end
