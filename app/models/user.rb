class User < ApplicationRecord
  has_many :tools, dependent: :destroy

  validates :first_name, :last_name, :address, :city, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
