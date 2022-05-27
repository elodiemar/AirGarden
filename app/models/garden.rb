class Garden < ApplicationRecord
  belongs_to :user
  validates :title, :capacity, :price_per_hour, :address, :town, presence: true
  # :address,
  # validates :address, uniqueness: true
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  geocoded_by :town
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_town,
  against: [:title, :town],
  using: {
  tsearch: { prefix: true }
  }
end
