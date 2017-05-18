class StudentController < ApplicationController
  def index
    @subjects = current_user.subject
  end
end
