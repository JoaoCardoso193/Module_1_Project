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
    system 'clear'

    #presents options to student 
    enumerate_options(['Make an appointment', 'View upcoming appointments'])
    user_input = int_input(s = "\nPlease select an option.", limits = [1, 2])
    
    #Taking user to secondary menu depending on input
    if user_input == 1
      create_appointment_menu
    end
    if user_input == 2
      view_upcoming_appointments_menu
    end
    
  end

  def create_appointment_menu
    system 'clear'

    #Show all tutors
    puts "Available tutors:"
    tutors = Tutor.all.map { |tutor| "Name: #{tutor.name}, Subject: #{tutor.subject}, Years of experience: #{tutor.years_of_experience}"}
    enumerate_options(tutors)

    #requesting and storing user input
    tutor = Tutor.find_by(id: int_input(s = "\nPlease select a tutor.", limits = [1, tutors.size]))

    #requesting appointment month
    months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}
    enumerate_options(months.values)
    month = int_input(s = "\nPlease select a month", limits = [1, 12])

    #requesting appointment day
    day = int_input(s = "\nPlease input a day", limits = [1, 31])

    #requesting an hour
    good_appts = tutor.appointments.select{|appt| appt.taken == false && appt.begin_datetime.mday == day && appt.begin_datetime.mon == month}
    display_hours = good_appts.map{|hora| "Start Time: #{hora.begin_datetime.hour}"}
    enumerate_options(display_hours)
    index = int_input(s = "\nPlease select an option", limits = [1, good_appts.size])
    hour = good_appts[index - 1].begin_datetime.hour 
    

    #requesting note
    puts "\nPlease leave a note"
    note = gets.chomp

    #creating appointment
    is_new = 
    appointment = @student.create_appointment(tutor, 2020, month, day, hour, note)
    if appointment != 'failed'
      puts "\nAppointment created successfully on #{months[month]}, #{day} at #{hour} o'clock!"
    end

    #returning home
    enumerate_options(['Create Another Appointment', 'Home'])
    user_input = int_input(s = "\nPlease select an option.", limits = [1, 2])
    if user_input == 1
      create_appointment_menu
    end
    if user_input == 2
      main_menu
    end
  end

  def view_upcoming_appointments_menu
    system 'clear'
    #save appointments as pretty strings and enumerate them
    appointments = @student.upcoming_appointments
    appointment_strings = appointments.map {|appointment| "Tutor: #{appointment.tutor.name}, Appointment id: #{appointment.id}, Start Time: #{appointment.begin_datetime}, End Time: #{appointment.end_datetime}, Note: #{appointment.note}"}
    enumerate_options(appointment_strings)

    #present user options
    enumerate_options(['Cancel an appointment', 'Home'])
    user_input = int_input(s = "\nPlease select an option.", limits = [1, 2])

    if user_input == 1
      i = int_input(s = "\nPlease enter the number of the appointment you'd like to cancel.", limits = [1, appointments.size])
      @student.cancel_appointment(appointments[i-1].id)
      puts "Appointment cancelled successfully!"
      sleep(2)
      view_upcoming_appointments_menu
    end

    if user_input == 2
      main_menu
    end

    end

end