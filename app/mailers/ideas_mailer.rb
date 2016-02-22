class IdeasMailer < ApplicationMailer

  def notify_idea_owner(idea, user)
    @user = user
    @idea = idea
    @owner = idea.user
    mail(to: @owner.email, subject: "#{user} liked your idea!")
  end

end
