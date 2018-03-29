class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_pseudo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  has_many :themes, dependent: :destroy
  # validates :pseudo, presence: true, uniqueness: true

  private

  def set_pseudo
    self.pseudo = "#{self.email[/^[^@]+/]}-#{SecureRandom.hex(1)}"
  end

end
