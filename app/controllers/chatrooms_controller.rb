class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
        @match = Match.find_by(chatroom: @chatroom)
    end
end
