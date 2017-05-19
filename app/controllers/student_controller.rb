class StudentController < ApplicationController
  def index
    @subjects = current_user.subjects
  end
end
