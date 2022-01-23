def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # create an array to check the cohort data
  months = ["january", "february", "march", "april", "may", "june", "july",
  "august", "september", "october", "november", "december"]
  # while the name is not empty, repeat this code
  while !name.empty? do
    # and ask for the cohort
    puts "Please enter the month of the cohort"
    # get the cohort
    cohort = gets.chomp.downcase
    # validate cohort
    until months.include? cohort.downcase
      # if nothing entered, apply deafault
      if cohort.empty?
        cohort = "january"
      else
      # if invalid, ask again then get the cohort
      puts "Invalid month entered for cohort, please try again"
      cohort = gets.chomp.downcase
      end
    end
      # if valid add the student hash to the array
      cohort = cohort.to_sym
      students << {name: name, cohort: cohort, country: :UK, age: :thirty}
      if students.count == 1
        puts "Now we have 1 student"
      else
        puts "now we have #{students.count} students"
      end
    # get another name from the user
    puts "Please enter another name"
    name = gets.chomp
  end
  # return the array of students
  students
end

<<<<<<< HEAD
def interactive_menu
  students = []
  loop do
  # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we will add more
  # 2. read the input and save it to a variable
    selection = gets.chomp
  # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
=======
def cohort_list(students)
  # create a list of all cohorts
  cohorts = students.map { |student| student[:cohort] }.uniq
  return cohorts
end

def print_cohorts(cohort, students)
  cohorts_array = Array.new
  cohort.each { |c|
    cohorts_array << c
    students.each { |student|
      if student[:cohort] == c
        cohorts_array << student[:name]
      end
    }
  }
  puts cohorts_array
>>>>>>> be241683aec56af8e738e4b42c480a2977643f2e
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  i = 0
  while i < students.length
      puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(40)
    i += 1
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall we have 1 great student"
  else
    puts "Overall, we have #{students.count} great students".center(40)
  end
end

<<<<<<< HEAD
# now call the interactive menu
interactive_menu
=======
# we have to call the methods!!
students = input_students
# check if any students have been entered
if students.length == 0
  # if not, tell them
  puts "No Students have been entered"
else
  # if students are there, complete the rest of the output
  cohorts = cohort_list(students)
  print_header
  print_cohorts(cohorts,students)
  #print(students)
  print_footer(students)
end
>>>>>>> be241683aec56af8e738e4b42c480a2977643f2e
