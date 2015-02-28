class Personal < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :date_of_birth, presence: true
  validates :gender, presence: true, inclusion: { in: %w(M F)}

  def to_param
    "#{id} #{first_name}".parameterize
  end

end
