module Api
  class ChatRoomsController < ApplicationController
    def index
      @chat_rooms = ChatRoom.all
      render json: {
        status: true,
        message: 'Chat rooms loaded',
        data: @chat_rooms
        
      }
    end

    def show
      @chat_room = ChatRoom.find(params[:id])
      render json: {
        status: true,
        message: 'Chat room loaded',
        data: {
          chat_room: @chat_room
        }
      }
    end

    def create
      @chat_room = ChatRoom.new(chat_room_params)
      if @chat_room.save
        render json: {
          status: true,
          message: 'Chat room created',
          data: {
            chat_room: @chat_room
          }
        }, status: :created
      else
        render json: {
          status: false,
          message: 'Failed to create chat room',
          data: @chat_room.errors
        }, status: :unprocessable_entity
      end
    end

    private

    def chat_room_params
      params.require(:chat_room).permit(:name)
    end
  end
end
