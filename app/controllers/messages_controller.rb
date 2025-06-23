class MessagesController < ApplicationController
  def index
    chat_room = ChatRoom.find(params[:chat_room_id])
    @messages = Message.includes(:user).where(chat_room_id: chat_room.id)
    render json: {
      status: true,
      message: 'Messages loaded',
      data: {
        name: chat_room.name,
        messages: @messages.as_json(include: { user: { only: :username } })
      }
    }
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: {
        status: true,
        message: 'Message created',
        data: {
          message: @message
        }
      }, status: :created
    else
      render json: {
        status: false,
        message: 'Failed to create message',
        data: @message.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :chat_room_id)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
