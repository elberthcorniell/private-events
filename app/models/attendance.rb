class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  scope :previous, -> { joins(:attended_event).where(['events.date < ?', Date.today.to_s]) }
  scope :upcoming, -> { joins(:attended_event).where(['events.date >= ?', Date.today.to_s]) }
end
