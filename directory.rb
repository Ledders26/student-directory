def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the stident hash to the array
    students << {name: name, cohort: :november, country: :UK, age: :thirty}
    puts "Now we have #{students.count} students".center(40)
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  i = 0
  while i < students.length
    if students[i][:name].start_with?("A") == true && students[i][:name].length < 12
      puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(40)
    end
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end

# we have to call the methods!!
students = input_students
print_header
print(students)
print_footer(students)