class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures

  validates :name, presence: true, length: { maximum: 20 }
  validates :about, length: { maximum: 100 }

  def to_params
    "#{id} #{name}".parameterize
  end

end
