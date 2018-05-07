class UsersController < ApplicationController

  before_action :set_current_user, except: [ :show ]

  def show
  	@user = User.where(params[:id])
  end

  private

  def set_current_user
  	@user = current_user
  end
end