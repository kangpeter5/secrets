class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  validates :content, presence: true

  def find_like_id current_user
	  Like.select(:id).where(user: current_user, secret: self)[0].id
  end
end
