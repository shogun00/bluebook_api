class Log < ApplicationRecord
  belongs_to :user

  scope :with_user, -> (id) { where(user_id: id) }

  validates :dive_count, :location, :date, :entry_type, :dive_purpose, :entry_time, :duration, :max_depth, presence: true
end
