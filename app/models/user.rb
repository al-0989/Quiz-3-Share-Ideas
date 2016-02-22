class User < ActiveRecord::Base
  has_many :ideas, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea
  
  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_secure_password

  validates :password, length: {minimum: 6}, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
