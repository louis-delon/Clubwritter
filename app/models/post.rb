class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  belongs_to :category
  belongs_to :group

  validates :content, presence: true
  validates :title, presence: true

end
