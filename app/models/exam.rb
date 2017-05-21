class Exam < ApplicationRecord
    has_many :exams_students, :class_name => 'ExamStudent'
    has_many :students, :through => :exams_students, :foreign_key => 'student_id', :source => :student

    belongs_to :subject, required: true

    def average_mark
        avg = exams_students.map{|m| m.grade}.reduce(:+)
        if exams_students.size == 0
            return 'N/A'
        else
            return avg / exams_students.size
        end
    end
end
