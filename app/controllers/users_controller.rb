class UsersController < ApplicationController
  def index
    ids = []
    Match.where(from_user_id: current_user.id).each do |item|
      ids << item.to_user_id
    end
    ids << current_user.id

    @user = User.all.where.not(id: ids).sample
  end

  def show
    @user = User.find(params[:id])
  end

  def like
    @user = User.find(params[:id])
    potential_match = Match.where(to_user_id: current_user.id, from_user_id: @user.id)
    already_liked = potential_match.count
    they_like_us = already_liked.positive?
    if they_like_us
      chatroom = Chatroom.create!
      potential_match.update(mutual: true, chatroom_id: chatroom.id)
    else
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id)
      @match.save
    end
    redirect_to users_path
  end

  def dislike
    redirect_to users_path
  end
end
