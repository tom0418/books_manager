class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit]

  def index; end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
