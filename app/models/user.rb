class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pictures
  has_many :comments
  has_one :personal, dependent: :destroy

  def personal_exists?
    true  if self.personal
  end
end
