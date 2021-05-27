class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = policy_scope(Match).where(from_user_id: current_user.id, mutual: true)
    @current_user = current_user
    authorize @current_user
  end
end
