module SubjectsHelper
  def student_avg(subject, student)
    avg = 0
    n = 0
    subject.exams.each do |exam|
      if (exam.exams_students.where(student: student).size == 1)
        avg += exam.exams_students.where(student: student)[0].grade
        n+=1
      end
    end
    if n == 0
      return 'N/A'
    end
    return avg/n
  end
end
