class Fishing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :field
 
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  validates :day, presence: true
  validates :memo, presence: true
  validates :name, presence: true
  validates :size, presence: true
  validates :count, presence: true
  validates :field_id, presence: true, numericality: { other_than: 0, message: "can't be blank" } 

  validate :day_after_today
  def day_after_today
    unless day == nil
      errors.add(:day, 'は、今日を含む過去の日付を入力して下さい') if day > Date.today
    end
  end

end
