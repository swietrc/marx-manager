class TeacherController < ApplicationController
  def index
    @subjects = Subject.where(owner_id: current_user)
  end
end
