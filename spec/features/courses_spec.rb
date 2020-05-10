require 'rails_helper'

RSpec.describe "Course Page ", type: :feature do

  before :each do
    @student1 = Student.create(
      name: "Harry",
      age: "11",
      house: "Gryfindoor",
    )
    @student2 = Student.create(
      name: "Crab",
      age: "11",
      house: "Slytherin",
    )
    @student3 = Student.create(
      name: "Ron",
      age: "11",
      house: "Gryfindoor",
    )
    @course1 = Course.create(
      name: "DATDA"
    )
    @course2 = Course.create(
      name: "Herbology"
    )
    @course3 = Course.create(
      name: "Potions"
    )
    @course4 = Course.create(
      name: "Alchemy"
    )
    @harry_course1 = StudentCourse.create(
      course_id: @course1.id,
      student_id: @student1.id
    )
    @harry_course2 = StudentCourse.create(
      course_id: @course2.id,
      student_id: @student1.id
    )
    @harry_course3 = StudentCourse.create(
      course_id: @course3.id,
      student_id: @student1.id
    )
    @malfoy_course1 = StudentCourse.create(
      course_id: @course1.id,
      student_id: @student2.id
    )
    @malfoy_course2 = StudentCourse.create(
      course_id: @course2.id,
      student_id: @student2.id
    )
    @ron_course1 = StudentCourse.create(
      course_id: @course1.id,
      student_id: @student3.id
    )
  end

  it "can list courses and number of students per course" do

    visit "/courses"

    expect(page).to have_content("Course Name: DATDA")
    expect(page).to have_content("DATDA student count: 3")

    expect(page).to have_content("Course Name: Herbology")
    expect(page).to have_content("Herbology student count: 2")

    expect(page).to have_content("Course Name: Potions")
    expect(page).to have_content("Potions student count: 1")
  end

  it "can list courses alpabetically" do
    visit "/courses"

    expect(page.all('h3')[0]).to have_content(@course4.name)
    expect(page.all('h3')[1]).to have_content(@course1.name)
    expect(page.all('h3')[2]).to have_content(@course2.name)
    expect(page.all('h3')[3]).to have_content(@course3.name)
  end

  it "can list studetns alphabetically" do
    visit "/courses"

    expect(page.all('p')[0]).to have_content(@student2.name)
    expect(page.all('p')[1]).to have_content(@student1.name)
    expect(page.all('p')[2]).to have_content(@student3.name)

    expect(page.all('p')[3]).to have_content(@student2.name)
    expect(page.all('p')[4]).to have_content(@student1.name)

    expect(page.all('p')[5]).to have_content(@student1.name)




  end

end#final

# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.
#
# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")
