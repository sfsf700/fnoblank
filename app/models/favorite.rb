class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :fishing

  validates_uniqueness_of :fishing_id, scope: :user_id

end
