class Booking < ApplicationRecord
  belongs_to :tool
  belongs_to :user
<<<<<<< HEAD
  validates :date_end, :date_stawrt, :tool, :user, presence: true
=======
  validates :date_end, :date_begin, :tool, :user, presence: true
>>>>>>> master
  validates_associated :tool

end
