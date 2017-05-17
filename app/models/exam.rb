class Exam < ApplicationRecord
    has_many :exams_students, :class_name => 'ExamStudent'
    has_many :students, :through => :exams_students, :foreign_key => 'student_id', :source => :student

    belongs_to :subject, required: true
end
