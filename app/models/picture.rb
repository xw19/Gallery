class Picture < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 70 }
  validates :photo, presence: true

  before_save :check_category

  def to_param
    "#{id} #{name}".parameterize
  end

  def check_category
    unless self.category
      self.category = Category.find_or_create_by!(name: "misc", description: "The misc category", purity: "safe")
    end
  end

end
