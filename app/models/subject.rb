class Subject < ApplicationRecord
    belongs_to :owner, :class_name => 'User'

    has_many :subjects_students, :class_name => 'SubjectStudent'
    has_many :students, :through => :subjects_students, :foreign_key => 'user_id', :source => :user

end
