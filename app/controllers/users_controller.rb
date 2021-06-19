class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Role for #{@user.email} was updated successfully!"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end
end
