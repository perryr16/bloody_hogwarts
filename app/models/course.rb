class Course <ApplicationRecord
  validates_presence_of :name
  has_many :student_courses
  has_many :students, through: :student_courses

  def self.alpha_list
    order(:name)
  end

end
