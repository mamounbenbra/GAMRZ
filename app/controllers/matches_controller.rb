class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = Match.all.where(from_user_id: current_user.id, mutual: true)
  end
end
