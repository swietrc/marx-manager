class ExamStudentController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def create_grade
    @grade = ExamStudent.new(exam_student_params)

  end


  private
    def exam_student_params
      params.require(:exams_students).permit(:grade, :student_id)
    end
end
