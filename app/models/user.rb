class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, length: { maximum: 40 }
  validates :last_name, length: { maximum: 40 }

  has_many :subjects_students, :class_name => 'SubjectStudent'
  has_many :subjects, :class_name => 'Subject', :through => :subjects_students

  def admin?
    return is_admin
  end

  def active_for_authentication? 
    super && approved? 
  end

  def full_name
    return first_name + " " + last_name
  end
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
