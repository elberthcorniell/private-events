class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator_id
  has_many :attendances, foreign_key: :attendee_id

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  def attended_events
    Attendance.where(['attendances.attendee_id = ?', self['id']])
  end
end
