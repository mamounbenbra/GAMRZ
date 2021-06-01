class ChatroomsController < ApplicationController
  def index
    messages?
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


  def messages?
    puts "i am playing messages ?"
    @empty_chatroom = false
    matches = Match.where(from_user: current_user.id, mutual: true)
    if matches.any?
      matches.each do |match|
        if match.chatroom.messages.none?
          @empty_chatroom = true
        end
      end
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @chatroom.messages.destroy_all
    @chatroom.destroy
    redirect_to chatrooms_path
  end

end
