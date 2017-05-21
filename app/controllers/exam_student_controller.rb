class ExamStudentController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def create_grade
    @grade = ExamStudent.new(exam_student_params)
    @grade.exam_id = params[:id]
    @grade.save

    redirect_to subject_exam_path(@grade.exam)
  end

  def delete
    @grade = ExamStudent.find(params[:grade_id])
    e = @grade.exam
    @grade.destroy

    redirect_to subject_exam_path(e)
  end

  private
    def exam_student_params
      params.require(:exam_student).permit(:grade, :student_id, :exam_id)
    end
end
