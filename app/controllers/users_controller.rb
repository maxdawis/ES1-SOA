class UsersController < ApplicationController
	def index
  # @users = User.all we will replace this old code - you can delete this line

  @users = User.page(params[:page]).per(30)
  # @sent_invites = current_user.sent_invites YOU CAN DELETE THIS LINE
  # @received_invites = current_user.received_invites YOU CAN DELETE THIS LINE

  @sent_invites = current_user.sent_invites.page(params[:page])
  @received_invites = current_user.received_invites.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
