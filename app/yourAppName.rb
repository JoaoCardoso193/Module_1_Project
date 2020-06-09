class App
  attr_reader :student
  # here will be your CLI!
  # it is not an AR class so you need to add attr

  def run
    welcome
    login_or_signup
    main_menu
  end

  private

  #method to get user input as an integer corresponding to an option
  #parameter 's' is the string printed to request user input, parameter 'limits' is the range of integers allowed as input
  def int_input(s = "\nPlease select an option", limits = [1, 100])
    puts s
    user_input = gets.chomp
    #if user types 'exit', exit the application
    if user_input.downcase == "exit"
      exit()
    end

    #if user input is within allowed range, return it, otherwise, ask for it again
    if user_input.to_i >= limits[0] and user_input.to_i <= limits[1]
        return user_input.to_i
    else
        puts("Invalid input, please enter an integer value coresponding to an option, or type 'exit' to exit application.")
        sleep(2)
        return int_input(s, limits)
    end
  end



  #method to enumerate out options in a menu
  def enumerate_options(options)
    puts "\n"
    options.each_with_index do |option, index|
      puts "[#{index+1}] #{option}"
    end
  end

  #prints welcome message
  def welcome
    "Hello! Welcome to our app"
    #sleep for a bit
    sleep(0.3)
    system 'clear'
  end


  #login method
  def login_or_signup
    #login prompt, gets user input
    puts "Please enter your username to sign up or log in"
    name = gets.chomp.capitalize

    #checking if student already exists, if not, ask for age and create a new student instance
    student_names = Student.all.map{|student| student.name}

    if student_names.include?(name)
      @student = Student.find_by(name: name)
    else
      puts "Please enter your age"
      age = gets.chomp.downcase
      @student = Student.create(name: name, age: age)
    end

    #sleep briefly
    sleep(1)

    #Welcome student
    puts "\nWelcome #{@student.name}!"
  end



  def main_menu
    #presents options to student 
    enumerate_options(['Make appointment', 'View appointments'])
    int_input(s = "\nPlease select an option.", limits = [1, 2])
  end



end