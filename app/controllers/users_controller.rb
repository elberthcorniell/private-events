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
    @upcoming_events = current_user.attended_events.upcoming
    @past_events = current_user.attended_events.previous
  end
end
