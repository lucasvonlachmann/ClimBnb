class Mountain < ApplicationRecord
  has_many :experiences
  validates :name, presence: true
  validates :city, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
