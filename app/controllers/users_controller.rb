class UsersController < ApplicationController
	before_action :set_user, only: [:create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # @users = User.all we will replace this old code - you can delete this line

    @users = User.page(params[:page]).per(30)
    
    # @sent_invites = current_user.sent_invites YOU CAN DELETE THIS LINE
    # @received_invites = current_user.received_invites YOU CAN DELETE THIS LINE

    # @sent_invites = current_user.sent_invites.page(params[:page])
    # @received_invites = current_user.received_invites.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

    def new
    @user = User.new
  end

# GET /users/1/edit
  def edit
  end
 
  # POST /users
  def create
    @user = User.new(user_params)
 
    if @user.save
      redirect_to users_url
    else
      render action: 'new'
    end
  end
 
  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      @user.update_without_password(user_params_without_password)
    else
      @user.update(user_params)
    end
 
    if @user.valid?
      if @user == current_user
        sign_in(@user, bypass: true)
      end
 
      redirect_to users_url
    else
      render action: 'edit'
    end
  end
 
  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuário excluído.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params_without_password
    user_params.delete(:password)
    user_params.delete(:password_confirmation)
    user_params
  end
end
