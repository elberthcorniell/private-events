require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it 'is not valid if attended event id is not provided' do
    user = User.create(name: 'test', email: 'testing@test.com', password: 'lucass')
    expect(Attendance.new(attendee_id: user.id)).to_not be_valid
  end

  it 'is not valid if attendee id is not provided' do
    user = User.create(name: 'test', email: 'testing@test.com', password: 'lucass')
    event = Event.create(title: 'Party', creator_id: user.id)
    expect(Attendance.new(attended_event_id: event.id)).to_not be_valid
  end

  it 'is valid if attendee id and the attended event id is provided' do
    user = User.create(name: 'test', email: 'testing@test.com', password: 'lucass')
    event = Event.create(title: 'Party', creator_id: user.id)
    expect(Attendance.new(attended_event_id: event.id, attendee_id: user.id)).to be_valid
  end
end
