class Group < ApplicationRecord
  has_many :posts
  validates :name
end
