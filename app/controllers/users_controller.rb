# rubocop:disable Layout/LineLength

class UsersController < ApplicationController
  def index
    if current_user
      redirect_to user_path(current_user.id)
    else
      redirect_to user_session_path
    end
  end

  def show
    @user = User.find(current_user.id)
    upcoming_events
    prev_events
  end

  private

  def upcoming_events
    @upcoming_events = Attendance.joins(:event).where(['events.date > ? AND attendances.user_id = ?', Date.today, current_user.id])
  end

  def prev_events
    @prev_events = Attendance.joins(:event).where(['events.date < ? AND attendances.user_id = ?', Date.today, current_user.id])
  end
end
# rubocop:enable Layout/LineLength
