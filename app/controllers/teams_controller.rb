class TeamsController < ApplicationController
	before_action :set_sport

	def index
		@teams = sport_class.all
		@team = sport_class.new
	end

	def create
		@team = sport_class.new(team_params)

		if @team.save
			redirect_to action: :index
		end

	end

	private

	def team_params
		params.require(sport.underscore.to_sym).permit(:name)
	end

	def set_sport
		@sport = sport
	end

	def sport
		params[:type] || "Team"
	end

	def sport_class
		sport.constantize
	end
end