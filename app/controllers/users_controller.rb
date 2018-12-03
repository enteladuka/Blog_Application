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
      #FLASH NOTICE THANKS FOR SIGNING UP #WHY NOT WORKING
      #log_in @user this logs user in upon signup
      redirect_to login_path #directs user to log in
    else
      render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      #FLASH NOTICE SUCCESSFUL PROFILE UPDATE
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = current_user
  end

  def destroy
    current_user.destroy
    #SUCCESS NOTICE ACCOUNT SUCCESSFULLY DELETED
    redirect_to posts_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
