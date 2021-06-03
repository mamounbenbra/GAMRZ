class MatchesController < ApplicationController
  def index
    messages?
    @user = current_user
    @matches = policy_scope(Match).where(from_user_id: current_user.id, mutual: true)
    @current_user = current_user
    authorize @current_user
  end

  def messages?
    puts "i am playing messages ?"
    @empty_chatroom = false
    matches = Match.where(from_user: current_user.id, mutual: true)
    if matches.any?
      matches.each do |match|
        if !match.chatroom.nil?
          if match.chatroom.messages.none?
            @empty_chatroom = true
          end
        end
      end
    end
  end
end
