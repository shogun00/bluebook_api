class Log < ApplicationRecord
  belongs_to :user

  scope :with_user, ->(id) { where(user_id: id) }
end
