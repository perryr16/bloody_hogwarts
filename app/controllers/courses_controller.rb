class CoursesController < ApplicationController

  def index
    @courses = Course.alpha_list  
  end

end
