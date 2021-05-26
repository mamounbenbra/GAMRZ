class MatchesController < ApplicationController
  def index
    @matches = Match.all.where(from_user_id: current_user.id, mutual: true)
  end
end
