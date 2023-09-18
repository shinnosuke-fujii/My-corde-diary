class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs
  has_many :mcds, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :liked_mcds, through: :likes, source: :mcd

  def already_liked?(mcd)
    self.likes.exists?(mcd_id: mcd.id)
  end

  mount_uploader :image, ImageUploader
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  has_many :mcds
  
  
end
