class UsersController < ApplicationController
  after_action :verify_authorized
  before_action :messages?


  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end

  def index
    @other_one = ""
    ids_to_kill = []
    Match.where(from_user_id: current_user.id).each do |item|
      ids_to_kill << item.to_user_id
    end
    ids_to_kill << current_user.id

    @users = policy_scope(User).where.not(id: ids_to_kill)

    if params[:region].present?
      @users = @users.where(region: params[:region])
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
    @match_mutual = params[:mutual]
    @other_one = params[:other_one] if params[:other_one].present?
    @user = @users.sample
    @current_user = current_user
    authorize @current_user

  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    authorize @user
  end

  def like
    @user = User.find(params[:id])
    @user.with_lock do
      potential_match = Match.where(to_user_id: current_user.id, from_user_id: @user.id)
      already_liked = potential_match.count
      they_like_us = already_liked.positive?
      @match_mutual = false
      @match = Match.find_by(from_user_id: current_user.id, to_user_id: @user.id)
      if @match.nil?
        if they_like_us
          chatroom = Chatroom.create!
          @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id, mutual: true, chatroom_id: chatroom.id)
          potential_match.update(mutual: true, chatroom_id: chatroom.id)
          @match_mutual = true
          ChannelMatchChannel.broadcast_to(@user, "Heyyyy i am a notification")
        else
          @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id)
        end
        @match.save
      end
    end

    sleep 0.3
    redirect_to users_path(region: params[:region], style: params[:style], rank: params[:rank], language: params[:language], mutual: @match_mutual, other_one: @match.to_user_id)
    @current_user = current_user
    authorize @current_user
  end

  def dislike
    @user = User.find(params[:id])
    potential_match = Match.where(to_user_id: current_user.id, from_user_id: @user.id)
    already_liked = potential_match.count
    they_like_us = already_liked.positive?
    @match_mutual = false
    if they_like_us
      potential_match.update(mutual: nil)
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id, mutual: nil)
    else
      @match = Match.new(from_user_id: current_user.id, to_user_id: @user.id, mutual: nil)
    end
    @match.save
    sleep 0.3
    redirect_to users_path(region: params[:region], style: params[:style], rank: params[:rank], language: params[:language], mutual: @match_mutual)
    @current_user = current_user
    authorize @current_user
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
end
