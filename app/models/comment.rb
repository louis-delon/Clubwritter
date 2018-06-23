class Comment < ApplicationRecord
  belongs_to :post
  validates :message, presence: true, length: { minimum: 10 }
end
