class Tool < ApplicationRecord
  CATEGORIES = {
    'jardin' => %w[jardin1 jardin2 jardin3],
    'travaux' => %w[travaux1 travaux2 travaux3],
    'décoration' => %w[décoration1 décoration2 décoration3]
  }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :category, :daily_price, :description, :condition, presence: true
end
