class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  belongs_to :booking
end
