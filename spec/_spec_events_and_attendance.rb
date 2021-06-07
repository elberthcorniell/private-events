require 'rails_helper'

RSpec.describe 'Events and Attendance', type: :system do
  describe 'home page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Events and Attendance')
    end
  end
end
