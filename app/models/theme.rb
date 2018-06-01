class Theme < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :deadline, presence: true
  validates :category_id, presence: true

  mount_uploader :photo, PhotoUploader



end
