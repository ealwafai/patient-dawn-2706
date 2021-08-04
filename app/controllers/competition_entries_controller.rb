class CompetitionEntriesController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.find_by(nickname: params[:nickname], hometown: params[:hometown])
    CompetitionEntry.create(competition_id: competition.id, team_id: team.id)
    redirect_to competition_path(competition.id)
  end
end
