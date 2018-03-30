class User < ApplicationRecord

  before_create :set_pseudo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :themes, dependent: :destroy
  # validates :pseudo, presence: true, uniqueness: true

  mount_uploader :avatar, PhotoUploader

  private

  # set automatically a username from the email when user registers itself
  def set_pseudo
    self.pseudo = "#{self.email[/^[^@]+/]}-#{SecureRandom.hex(1)}"
  end

end
