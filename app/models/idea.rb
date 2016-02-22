class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user

  validates :title, presence: true, uniqueness: true

  # Uses the full name method defined in the users model.
  def user_full_name
    user.full_name if user
  end

  def like_for(user)
    likes.find_by_user_id(user)
  end

  def join_for(user)
    joins.find_by_user_id(user)
  end
end
