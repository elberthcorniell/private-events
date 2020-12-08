class UsersController < ApplicationController
  def show
    @users = User.find(current_user.id)
  end
end
