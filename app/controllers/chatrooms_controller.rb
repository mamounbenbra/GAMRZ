class ChatroomsController < ApplicationController

  def index
    @chatrooms = Match.where("from_user_id = ? OR to_user_id = ?", current_user.id, current_user.id).map{ |match| match.chatroom }.uniq.reject(&:nil?)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @match = Match.find_by(chatroom: @chatroom)
  end
end
