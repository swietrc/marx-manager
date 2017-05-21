class ExamsController < ApplicationController
  load_and_authorize_resource

  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @grades = Exam.find(params[:id]).exams_students
    @new_grade = ExamStudent.new
    @new_grade.exam = Exam.find(params[:id])
    student_marked = ExamStudent.where(exam_id: params[:id]).map{ |s| s.student_id}
    @student_options = Subject.find(params[:subject_id]).students.where.not(id: student_marked).map { |u| [u.full_name, u.id]}
  end

  # GET /subject/1/exams/new
  def new
    @exam = Exam.new
    @exam.subject = Subject.find(params[:subject_id])

  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to subject_exam_path(@exam.subject, @exam), notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_grade
    @grade = ExamStudent.new(exam_student_params)

  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to subject_exam_path(@exam.subject, @exam), notice: 'Examen édité avec succes.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name, :date, :subject_id)
    end

    def exam_student_params
      params.require(:exams_students).permit(:grade, :student_id)
    end
end
