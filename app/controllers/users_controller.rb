class UsersController < ApplicationController
  def index
    ids_to_kill = []
    Match.where(from_user_id: current_user.id).each do |item|
      ids_to_kill << item.to_user_id
    end
    ids_to_kill << current_user.id

    @users = User.all.where.not(id: ids_to_kill)

    if params[:region].present?
      @users = @users.where(region: params[:region])
    end
    if params[:age].present?
      @users = @users.where(age: params[:age])
    end
    if params[:rank].present?
      @users = @users.where(rank: params[:rank])
    end
    if params[:style].present?
      @users = @users.where(style: params[:style])
    end
    if params[:language].present?
      @users = @users.where(language: params[:language])
    end

    @user = @users.sample

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
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id, mutual: true)
      chatroom = Chatroom.create!
      potential_match.update(mutual: true, chatroom_id: chatroom.id)
    else
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id)
    end
    @match.save
    redirect_to users_path
  end

  def dislike
    @user = User.find(params[:id])
    potential_match = Match.where(to_user_id: current_user.id, from_user_id: @user.id)
    already_liked = potential_match.count
    they_like_us = already_liked.positive?
    if they_like_us
      potential_match.update(mutual: nil)
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id, mutual: nil)
    else
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id, mutual: nil)
    end
    @match.save
    redirect_to users_path
  end
end
