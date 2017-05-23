class Subject < ApplicationRecord
    validates :name, presence: true

    validate :owner_is_teacher

    belongs_to :owner, :class_name => 'User', required: true
    has_many :subjects_students, :class_name => 'SubjectStudent'
    has_many :students, :through => :subjects_students, :foreign_key => 'user_id', :source => :user
    has_many :exams

    def owner_is_teacher
        errors.add(:owner_id, "is not a teacher") unless owner.is_teacher?
    end
end
