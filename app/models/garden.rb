class Garden < ApplicationRecord
  belongs_to :user
  validates :title, :address, :capacity, :price_per_hour, presence: true
  validates :address, uniqueness: true
end
