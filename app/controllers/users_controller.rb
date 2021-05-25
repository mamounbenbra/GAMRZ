class UsersController < ApplicationController
  def index
    @user = User.all.where.not(id: current_user.id).sample
  end

  def show
    @user = User.find(params[:id])
  end
end
