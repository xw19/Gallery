class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  has_many :reports, as: :reportable
  paginates_per 5

  validates :body, presence: true, length: { maximum: 100 }
end
