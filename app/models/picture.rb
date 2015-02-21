class Picture < ActiveRecord::Base
  belongs_to :category
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 70 }
  validates :photo, presence: true

end
