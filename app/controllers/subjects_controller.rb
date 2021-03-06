class SubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subjectStudent = SubjectStudent.new
    @subjectStudent.subject_id = params[:id]

    exclude = Subject.find(params[:id]).students

    @student_options = User.where(is_teacher: false).where.not(id: exclude).map { |u| [u.full_name, u.id]}
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    @subject.owner = current_user

    if @subject.save
      redirect_to @subject, notice: 'La matière a été créée avec succès.'
    else
      render :new
    end
  end

  # POST /subjects/1/subscribe
  def add_student
    @subjectStudent = SubjectStudent.new(add_student_params)
    @subject = Subject.find(params[:id])
    @subjectStudent.save
    redirect_to @subject
  end

  # DELETE /subjects/1/unsubscribe/1
  def remove_student
    subject = Subject.find(params[:id])
    student = subject.students.find(params[:student_id])
    subject.students.delete(student)
    redirect_to @subject
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :start_date, :finish_date, :owner_id)
    end

    def add_student_params
      params.require(:subject_student).permit(:user_id, :subject_id)
    end
end
