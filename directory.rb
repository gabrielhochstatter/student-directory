# define global variable for students
@students = []

# define methods
def input_students # asks for names of students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def print_header # prints header
  puts "The students of Villans Academy"
  puts "-------------"
end

def print_student_list(students) # prints list of students
  students.each_with_index { |student , i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names) # prints the footer with count of students
  puts "Overall, we have #{names.count} great students"
end

def no_students # message for user when no students are in the list
  puts "There are no names in the list yet!"
end

def print_menu # prints the menu with user options
  # show the menu to the user
  puts "Please choose from the following options:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load list of students from file"
  puts "9. Exit"
end

def show_students # shows the list of students with header/footer or an error if list is empty
  if @students.empty?
    no_students
  else
    print_header
    print_student_list(@students)
    print_footer(@students)
  end
end

def save_students(filename = "students.csv") # saves list of students to CSV file
  # open the file
  file = File.open(ARGV.first, "w")
  # iterate over array of students
  @students.each { |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
  puts "List of students saved to #{ARGV.first}"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each { |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  }
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}!"
  else
    puts "Sorry, #{filename} doesn't exist!"
    exit
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu # runs the menu
  loop {
    print_menu
    process(STDIN.gets.chomp)
   }

end

try_load_students
interactive_menu
