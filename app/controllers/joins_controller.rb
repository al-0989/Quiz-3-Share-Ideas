class JoinsController < ApplicationController

  before_action :authenticate_user

  def index
    @join = current_user.joined_users
  end

  def create
    idea = Idea.find(params[:idea_id])
    join = Join.new(idea: idea, user: current_user)
    if join.save
      redirect_to idea, notice: "Idea joined!"
    else
      redirect_to idea, alert: "Join failed. Users unable to join own ideas."
    end
  end

  def destroy
    join = current_user.joins.find(params[:id])
    idea = Idea.find(params[:idea_id])
    join.destroy
    redirect_to idea, notice: "Unjoined idea."
  end

end
