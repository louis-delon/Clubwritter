class Category < ApplicationRecord
  has_many :themes, dependent: :destroy
  validates :name, presence: true
end

