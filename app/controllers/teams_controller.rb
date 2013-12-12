class TeamsController < ApplicationController
	before_action :set_sport

	def index
		@teams = sport_class.all
		@team = sport_class.new
	end

	def show
		@team = sport_class.find(params[:id])
	end

	def create
		@team = sport_class.new(team_params)
		if @team.save
			flash[:success] = "Team added!"
			redirect_to action: :index
		end
	end

	def edit
		@team = sport_class.find(params[:id])
	end

	def update
		@team = sport_class.find(params[:id])
		if @team.update(team_params)
			flash[:success] = "Team updated!"
			redirect_to action: :index
		else
			render "edit"
		end
	end

	def destroy
		@team = sport_class.find(params[:id])
		@team.destroy
		flash[:warning] = "Team deleted!"
		redirect_to action: :index
	end

	private

	def team_params
		params.require(sport.underscore.to_sym).permit(:city, :name, :abbreviation)
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