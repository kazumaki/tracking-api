class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  def destroy

  end

  private

  def user_params
    params.permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
