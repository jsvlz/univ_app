class LoginsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]

  def new
    # @logins = Logins.new
  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)

    if student && student.authenticate(params[:logins][:password]) #if student exists and password matches
      session[:student_id] = student.id
      flash[:success] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:danger] = "Something was wrong with your login info"
      render 'new'
    end

  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end
