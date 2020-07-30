class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def current_user
    User.find_by!(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
