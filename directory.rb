# defining methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villans Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index { |student , i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def no_students
  puts "There are no names in the list yet!"
end

def interactive_menu
  students = []
  loop {
    # show the menu to the user
    puts "Please choose from the following options:"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # save user input as a variable
    selection = gets.chomp
    # do what the user asked
    case selection
    when "1"
      students = input_students
    when "2"
      if students.empty?
        no_students
      else
        print_header
        print(students)
        print_footer(students)
      end
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"

    end

   }

end

interactive_menu
