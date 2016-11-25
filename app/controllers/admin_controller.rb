class AdminController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def users
    @users = User.all
  end
end
