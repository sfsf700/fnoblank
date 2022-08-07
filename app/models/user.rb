class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :field
  belongs_to :history
  has_many :favorites, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :profile, presence: true
  validates :history_id, presence: true

  def already_favorited?(fishing)
    self.favorites.exists?(fishing_id: fishing.id) #既にお気に入り登録されてあったら？
  end

end
