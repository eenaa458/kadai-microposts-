class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites, dependent: :destroy
  has_many :fav_users, through: :favorites, source: :user
  
  # マイクロポストをいいねする
  def favorite(user)
    favorites.create(user_id: user.id)
  end
  
   # マイクロポストのいいねを解除する
  def unfavorite(user)
    favorites.find_by(user_id: user.id).destroy
  end
  
    # 現在のユーザーがいいねしてたらtrueを返す
  def favorite?(user)
    fav_users.include?(user)
  end
end
