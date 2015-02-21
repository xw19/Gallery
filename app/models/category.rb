class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :pictures
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 50 }
  validates :purity, presence: true, inclusion: { in: %w(safe sketchy nsfw) }
end
