class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_student, only: [:edit, :update]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You have successfully signed up"
      redirect_to students_path
    else
      render 'new'
    end
  end

  def show
    # @student = set_student #setting student above
  end

  def index
    @students = Student.all
  end

  def edit
    # @student = set_student #setting student above
  end

  def update
    # @student = set_student #setting student above

    if @student.update(student_params)
      flash[:success] = "User account updated"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student
      redirect_to student_path(current_user)
      flash[:danger] = "You can only edit your own profile"
    end
  end

end
