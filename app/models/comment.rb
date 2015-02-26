class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture

  validates :body, presence: true, length: { maximum: 100 }
end
