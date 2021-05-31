class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Match).where("from_user_id = ? OR to_user_id = ?", current_user.id, current_user.id)
    @chatrooms = @chatrooms.map{ |match| match.chatroom }.uniq.reject(&:nil?)

    if params[:query].present?
      @chatrooms = @chatrooms.select do |chatroom|
        chatroom.other_user(current_user).username.include?(params[:query])
      end
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @match = Match.find_by(chatroom: @chatroom)
    user = User.find_by(id: @match.from_user_id)
    @x = "https://steamcommunity.com/search/users/#text=#{user.Steam_Username}"
    authorize @chatroom
  end
end
