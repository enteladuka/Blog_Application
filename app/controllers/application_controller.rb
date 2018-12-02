class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


####Can remove this, just requires user to be logged in ####
###DONT GET THIS ###
  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      #INCLUDE A FLASH NOTICE SAYING USER NEEDS TO LOG IN
      redirect_to login_url
    end
  end

end
