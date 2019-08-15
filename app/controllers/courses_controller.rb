class CoursesController < ApplicationController

  skip_before_action :require_user

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "You have successfully added a course"
      redirect_to root_path
    else
      render 'new'
    end

  end

  def show

  end

  private

  def course_params
    params.require(:course).permit(:short_name, :name, :description)
  end

end
