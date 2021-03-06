class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  mount_uploader :user_photo, ProfilePhotoUploader

  has_many :murals
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == "admin"
  end
end
