class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  has_one :room
  validates :start_date, :end_date, presence: true

end
