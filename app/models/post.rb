class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  belongs_to :category
  has_many :comments

  validates :content, presence: true
  validates :theme, presence: true
  validates :user, presence: true
  validates :category, presence: true

end
