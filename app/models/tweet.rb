class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  #has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :place, presence: true
  validates :introduction, presence: true  
  validates :image, presence: true
end
