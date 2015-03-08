class FrontTile < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :image_url, presence: true, length: { maximum: 100 }
  validates :link_url, presence: true, length: { maximum: 100 }
end
