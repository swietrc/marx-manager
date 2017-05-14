class SubjectStudent < ApplicationRecord
    self.table_name = "subjects_students"
    belongs_to :user
    belongs_to :subject
end