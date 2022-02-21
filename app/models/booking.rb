class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  validates :date_end, :date_start, :tool, :user, presence: true
  validates_associated :tool

end
