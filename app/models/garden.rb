class Garden < ApplicationRecord
  belongs_to :user
  validates :title, :capacity, :price_per_hour, :address, :town, presence: true
  # :address,
  # validates :address, uniqueness: true
  has_many_attached :photos
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_title_and_town,
  against: [ :title, :town ],
  using: {
  tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
