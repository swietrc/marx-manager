class ExamStudentController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def create_grade
    @grade = ExamStudent.new(exam_student_params)
    @grade.exam_id = params[:id]
    @grade.save
  end

  def delete
    @grade = ExamStudent.where(exam_id: params[:exam_id], student_id: params[:student_id])
    @grade.destroy
  end

  private
    def exam_student_params
      params.require(:exam_student).permit(:grade, :student_id, :exam_id)
    end
end
