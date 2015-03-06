class Picture < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :album
  has_many :comments, dependent: :destroy
  has_many :reports, as: :reportable
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 70 }
  validates :photo, presence: true

  before_save :check_category, :add_to_default_album

  def to_param
    "#{id} #{name}".parameterize
  end

  private

  def check_category
    unless self.category
      self.category = Category.find_or_create_by!(name: "misc", description: "The misc category", purity: "safe")
    end
  end

  def add_to_default_album
    unless self.album
      self.album = Album.find_or_create_by(user_id: self.user_id, name: "default")
    end
  end

end
