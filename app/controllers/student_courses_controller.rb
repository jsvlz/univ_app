class StudentCoursesController < ApplicationController

  def create
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(student: current_user, course: course_to_add)
      flash[:success] = "You have successfully enrolled in #{course_to_add.name}"
      redirect_to current_user
    else
      flash[:danger] = "Something went wrong with your enrollment"
    end
  end

end
