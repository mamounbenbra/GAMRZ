class ChatroomsController < ApplicationController

  def index
    @chatrooms = Match.where("from_user_id = ? OR to_user_id = ?", current_user.id, current_user.id).map{ |match| match.chatroom }.uniq.reject(&:nil?)

    if params[:query].present?
      @chatrooms = @chatrooms.select do |chatroom|
        chatroom.other_user(current_user).username.include?(params[:query])
      end
     @current_user = current_user
    authorize @current_user
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @match = Match.find_by(chatroom: @chatroom)
    authorize @chatroom
  end
end
