class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    messages?
  end

  def messages?
    puts "i am playing messages ?"
    @empty_chatroom = false
    @new_matches = []
    matches = Match.where(from_user: current_user.id, mutual: true)
    if matches.any?
      matches.each do |match|
        if match.chatroom.messages.none?
          @empty_chatroom = true
          @new_matches << match
        end
      end
    end
  end
end
