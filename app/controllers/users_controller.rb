class UsersController < ApplicationController
  def index
    @user = User.all.where.not(id: current_user.id).sample
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
      potential_match.update(mutual: true)
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
