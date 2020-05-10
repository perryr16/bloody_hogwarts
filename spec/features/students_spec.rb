require 'rails_helper'

RSpec.describe "Students Page ", type: :feature do

  before :each do
    @student1 = Student.create(
      name: "Harry",
      age: "11",
      house: "Gryfindoor",
    )
    @student2 = Student.create(
      name: "Crab",
      age: "12",
      house: "Slytherin",
    )
    @student3 = Student.create(
      name: "Ron",
      age: "15",
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
    @stud_course1 = StudentCourse.create(
      course_id: @course1.id,
      student_id: @student1.id
    )
    @stud_course2 = StudentCourse.create(
      course_id: @course2.id,
      student_id: @student1.id
    )
    @stud_course3 = StudentCourse.create(
      course_id: @course3.id,
      student_id: @student1.id
    )
  end


  it "can see list of stduents with info" do

    visit "/students"

    expect(page).to have_content("Name: #{@student1.name}")
    expect(page).to have_content("Age: #{@student1.age}")
    expect(page).to have_content("House: #{@student1.house}")

    expect(page).to have_content("Name: #{@student2.name}")
    expect(page).to have_content("Age: #{@student2.age}")
    expect(page).to have_content("House: #{@student2.house}")

    expect(page).to have_content("Name: #{@student3.name}")
    expect(page).to have_content("Age: #{@student3.age}")
    expect(page).to have_content("House: #{@student3.house}")
  end

  it "can see individual student details and courses" do
    visit "/students/#{@student1.id}"

    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course2.name)
    expect(page).to have_content(@course3.name)

  end

  it "can show average age of students" do

    visit "/students"

    expect(page).to have_content("Average age: 12.67")

  end

  it "can list students alpabetically" do
    visit "/students"

    expect(page.all('h3')[0]).to have_content(@student2.name)
    expect(page.all('h3')[1]).to have_content(@student1.name)
    expect(page.all('h3')[2]).to have_content(@student3.name)

  end



end #final
