class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :themes, dependent: :destroy
  validates :name, presence: true
end

