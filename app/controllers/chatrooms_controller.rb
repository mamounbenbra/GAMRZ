class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @match = Match.find_by(chatroom: @chatroom)
  end
end
