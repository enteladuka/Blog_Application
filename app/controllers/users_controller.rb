class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) #find converts string "1" to integer
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for signing up!" #WHY NOT WORKING
      #log_in @user this logs user in upon signup
      redirect_to login_path #directs user to log in
    else
      render "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end