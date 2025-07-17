class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path, notice: "Professeur ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :instrument, :bio, :photo_url)
  end
end
