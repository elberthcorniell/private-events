class UsersController < ApplicationController
  def index; end

  def show
    @users = User.find(current_user.id)
  end
end
