require 'faker'
require 'pry'
require_relative 'student'
require_relative 'classroom'
require_relative 'grade'
require_relative 'reportcard'

# Our four classrooms for the first years
@A = Classroom.new("1A")
@B = Classroom.new("1B")
@C = Classroom.new("1C")
@D = Classroom.new("1D")

# Create test students with grades in various subjects
def generate_student
  s = Student.new(Faker::Name.name, rand(0..100))
  s.report_card.add_grade("math", rand(0..100))
  s.report_card.add_grade("history", rand(0..100))
  s.report_card.add_grade("english", rand(0..100))
  s.report_card.add_grade("science", rand(0..100))
  s
end

# Generate our students
21.times do |i|
  @A.add_student(generate_student)
  @B.add_student(generate_student)
  @C.add_student(generate_student)
  @D.add_student(generate_student)
end

# Check the rosters

  @A.roster
  puts "\n"
  @B.roster
  puts "\n"
  @C.roster
  puts "\n"
  @D.roster




############################################################
# CHALLENGE 1

def find_failing(classroom)
  classroom.students.each { |key, value|
    total = 0
    value.report_card.grades.each do |key, value|
      total = total + value
    end
    if total > 200
      puts "#{value.name}: PASS"
    else
      puts "#{value.name}: FAIL"
    end
    }
end

find_failing(@A)

############################################################
# CHALLENGE 2
def find_exceptional(classroom)
  classroom.students.each { |key, value|
    total = 0
    value.report_card.grades.each do |key, value|
      total = total + value
    end
    if total > 260
      puts "#{value.name}"
    end
    }
end

find_exceptional(@B)

############################################################
