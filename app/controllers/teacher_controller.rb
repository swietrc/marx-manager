class TeacherController < ApplicationController
  def index
    @subjecs = current_user.subjects
  end
end
