class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  belongs_to :category

  validates :content, presence: true

end
