class Log < ApplicationRecord
  belongs_to :user

  scope :with_user, -> (id) { where(user_id: id) }
  scope :sort_by_count, -> (params = nil) {
          direction = params.presence || 'desc'
          order(dive_count: direction)
        }

  validates :dive_count, :location, :date, :entry_type, :dive_purpose, :entry_time, :duration, :max_depth, presence: true
end
