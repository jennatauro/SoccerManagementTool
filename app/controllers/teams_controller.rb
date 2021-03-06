class TeamsController < ApplicationController

  http_basic_authenticate_with name: "jet", password: "secret", except: [:index, :show]

  def new
    @team = Team.new
  end
   
  def create
    @team = Team.new(team_params)
   
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def show
  	@team = Team.find(params[:id])
	end

  def index
    @teams = Team.all
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
  @team = Team.find(params[:id])
 
    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
   
    redirect_to teams_path
  end

  private
    def team_params
      params.require(:team).permit(:name, :text)
    end

end
