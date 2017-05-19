module SubjectsHelper
  def student_avg s
    avg = 0
    n  = 0
    @subject.exams.each do |exam|
      if (exam.exams_students.where(student: s))
        avg += exam.exams_students.where(student: s)[0].grade
        n+=1
      end
    end
    return avg/n
  end
end
