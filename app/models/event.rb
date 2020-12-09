class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id

  scope :upcoming_events, -> { where(['events.date > ?', Date.today]) }
  scope :prev_events, -> { where(['events.date <= ?', Date.today]) }
end
