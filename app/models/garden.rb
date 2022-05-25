class Garden < ApplicationRecord
  belongs_to :user
  # validates :title, :capacity, :price_per_hour, presence: true
  # :address,
  # validates :address, uniqueness: true
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
end
