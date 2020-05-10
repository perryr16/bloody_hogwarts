class StudentsController < ApplicationController

  def index
    @students = Student.alpha_list
  end

  def show
    @student = Student.find(params[:id])
  end

end
