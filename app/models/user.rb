class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :experiences
  has_many :bookings

  validates :email, presence: true

  mount_uploader :photo, PhotoUploader

  def fullname
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
