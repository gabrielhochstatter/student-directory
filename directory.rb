
# put all student names into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# then list them
puts "The students of Villans Academy"
puts "-------------"
students.each_char { |student| puts student }
# Finally we print the total
puts "Overall, we have #{students.count} great students"
