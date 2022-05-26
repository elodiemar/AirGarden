class Review < ApplicationRecord
  belongs_to :garden
  validates :content, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: 0..5 }
end
