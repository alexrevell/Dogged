class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
  end

  def _admin_index
    @users = User.all
  end

  def show
    @user = current_user
  end

end
