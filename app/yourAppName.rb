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

  # def int_input(limits = [])
  #   begin
  #     user_input = gets.chomp.to_i
  #   rescue
  #     puts 'must be an integer value'
  #     user_input = gets.chomp.to_i
  #   end

  # end

  # def int_input(limits = []):
  #   user_input = gets.chomp
  #   if user_input == "exit" or user_input == 'Exit':
  #     exit()
  #   end

  #   begin
  #     if limits != []
  #       if int(user_input) >= limits[0] and int(user_input) <= limits[1]
  #         return int(user_input)
  #       else
  #         print("Value outside limits!")
  #               return int_input(limits)
  #       else:
  #           return int(user_input)
  #   except:
  #       print("Must be an integer value!")
  #       return int_input(s)

  #prints welcome message
  def welcome
    "Hello! Welcome to our app"
    #sleep for a bit
    sleep(0.3)
    system 'clear'
  end

  def login_or_signup
    #login prompt, gets user input
    puts "Please enter your username to sign up or log in"
    name = gets.chomp.downcase

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
    sleep(0.3)

    #Welcome student
    puts "Welcome #{@student.name}"
  end



  def main_menu
    #presents options to student 
    options = ['Make appointment', 'View appointments']

    options.each_with_index do |option, index|
      puts "[#{index+1}] #{option}"
    end

    puts 'testing input'
    int_input
  end



end