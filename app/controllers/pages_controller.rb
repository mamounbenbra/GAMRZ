class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    messages?
  end

  def messages?
    if user_signed_in?
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
  end
end
