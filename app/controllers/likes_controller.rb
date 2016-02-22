class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    idea = Idea.find(params[:idea_id])
    like = Like.new(idea: idea, user: current_user)
    if like.save
      redirect_to idea, notice: "Liked!"
    else
      redirect_to idea, alert: "Like failed. Users unable to like own ideas."
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])
    idea = Idea.find(params[:idea_id])
    like.destroy
    redirect_to idea, notice: "Un-liked"
  end
end
