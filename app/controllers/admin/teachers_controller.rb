module Admin
  class TeachersController < ApplicationController
    def index
      @teachers = Teacher.all
    end

    def show
      @teacher = Teacher.find(params[:id])
    end

    private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :instrument, :bio, :photo_url)
    end

    def check_admin
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user&.admin?
    end
  end
end
