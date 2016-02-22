class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates :user_id, :idea_id, presence: true
  validates :user_id, uniqueness: {scope: :idea_id}

  validate :users_cant_like_their_ideas

  private

  def users_cant_like_their_ideas
    return if user.nil? or idea.nil?
    if user_id == idea.user_id
      errors[:base] = "A user can't like their own ideas"
    end
  end

end
