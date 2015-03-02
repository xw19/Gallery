class Report < ActiveRecord::Base
  belongs_to :reportable, polymorphic: true

  validates :reason, presence: true, length: { maximum: 50 }
end
