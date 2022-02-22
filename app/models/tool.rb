class Tool < ApplicationRecord
  CATEGORIES = {
    'garden' => %w[handtools motorized clothes],
    'works' => %w[handtools powertools protection],
    'decoration' => %w[painting tiling accessories]
  }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :category, :daily_price, :description, :condition, presence: true
end
