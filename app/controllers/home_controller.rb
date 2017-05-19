class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    if current_user
      if current_user.admin?
        redirect_to admin_path
      elsif current_user.is_teacher
        redirect_to teacher_index_path
      else
        redirect_to student_index_path
      end
    end
  end
end
