class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments

  validates :content, presence: true
  validates :theme, presence: true
  validates :user, presence: true

end
