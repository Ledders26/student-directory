@students = [] # an empty array accessible across all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save a list of students"
  puts "4. Load a list of students"
  puts "9. Exit" # 9 because we will add more
end

def interactive_menu
  loop do
  print_menu
  process_menu_choice(STDIN.gets.chomp)
  end
end

def process_menu_choice(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Please provide the filename"
    file = gets.chomp
    save_students(file)
  when "4"
    puts "Please provide the filename"
    file = gets.chomp
    load_students(file)
  when "9"
    puts "Goodbye!"
    exit # this will cause the programme to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp # get the first name
  while !name.empty? do # while the name is not empty, repeat this code
    add_to_students(name, :november) # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another name from the user
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
  file = File.open(filename, "w") do |file| # open the file for writing
    @students.each do |student| # iterate over the array of students
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "File #{filename} has been saved"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_to_students(name, cohort)
    end
  end
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # if no filename given, call without parameter so default used
    load_students
  elsif File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def add_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu