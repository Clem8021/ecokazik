class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(admin: params[:user][:admin])
    redirect_to admin_users_path, notice: "Utilisateur mis à jour."
  end

  private

  def require_admin
    redirect_to root_path, alert: "Accès non autorisé." unless current_user.admin?
  end
end
