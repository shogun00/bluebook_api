class Log < ApplicationRecord
  belongs_to :user

  scope :with_user, -> (id) { where(user_id: id) }
  scope :sort_by_count, -> (params = nil) {
          direction = params.presence || 'desc'
          order(dive_count: direction)
        }

  validates :dive_count, :location, :spot, :date, :entry_style, :dive_style, :entry_time, :duration, :publication, presence: true

  enum dive_style: {scuba: 0, free: 1}
  enum entry_style: {boat: 0, beach: 1}
  enum tank_material: {steel: 0, aluminum: 1, another: 2}
  enum suit_type: {swim: 0, wet: 1, dry: 2}
  enum weather: {sunny: 0, cloudy: 1, rainy: 2}
  enum wave: {big: 0, middle: 1, small: 2}
  enum publication: {open: 0, close: 1}

end
