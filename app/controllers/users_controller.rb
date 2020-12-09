class UsersController < ApplicationController
  def index; end

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
