class Experience < ApplicationRecord

  belongs_to :mountain
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  mount_uploader :photo, PhotoUploader
end
