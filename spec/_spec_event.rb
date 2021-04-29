require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is not valid if the Attendances are not provided' do
    user = User.create(name: 'test', email: 'testing@test.com', password: 'lucass')
    expect(Event.new(creator_id: user.id)).to_not be_valid
  end

  it 'is not valid if the attended event id is not provided' do
    user = User.create(name: 'test', email: 'testing@test.com', password: 'lucass')
    expect(Event.new(creator_id: user.id, title: 'we made it')).to be_valid
  end
end
