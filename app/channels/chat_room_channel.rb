class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:chat_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # Handle incoming message and broadcast (to be implemented)
  end
end
