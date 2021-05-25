class MatchesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @matches = Match.all.where(from_user_id: current_user.id)
    end
end
