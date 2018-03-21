class Theme < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :posts, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  validates :name, presence: true
  validates :deadline, presence: true
  validates :category_id, presence: true

end
