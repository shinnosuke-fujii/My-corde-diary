class Like < ApplicationRecord
  belongs_to :mcd
  belongs_to :user
  validates_uniqueness_of :mcd_id, scope: :user_id
end
