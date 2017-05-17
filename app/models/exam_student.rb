class ExamStudent < ApplicationRecord
    self.table_name = "exam_student"
    belongs_to :student, class_name: 'User'
    belongs_to :exam
end