# require 'capybara/rails'
require 'rails_helper'
# require_relative '../app/models/user'

RSpec.describe User, type: :model do
  it 'it is not valid without attributes' do
    expect(User.new).to_not be_valid
  end

  it 'is not valid without valid email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password ' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is valid if user provides all information' do
    user = User.new(name: 'test', email: 'testing@test.com', password: 'lucass')
    expect(user).to be_valid
  end
end
