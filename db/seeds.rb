# require 'pry'

Student.destroy_all
Appointment.destroy_all
Tutor.destroy_all
Student.reset_pk_sequence
Appointment.reset_pk_sequence
Tutor.reset_pk_sequence

#Vidhi, available every weekday 9-17
vidhi = Tutor.create(name: "Vidhi", subject: "CS", years_of_experience: 10)
vidhi_times = (9..17)

sylwia = Tutor.create(name: "Sylwia", subject: "CS", years_of_experience: 10)
sylwia_times = (6..14)

alex = Tutor.create(name: "Alex", subject: "CS", years_of_experience: 10)
alex_times = (9..12)

joe = Tutor.create(name: "Joe", subject: "Ways of the Samurai", years_of_experience: 50)
joe_times = (8..20)

shaq = Tutor.create(name: "Shaq", subject: "Balling", years_of_experience: 25)
shaq_times = (12..17)


#creating appointments
for month in (1..12)
    if month == 4 or month == 6 or month == 9 or month == 11
        for day in (1..30)
            for hour in vidhi_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: vidhi)
            end
            for hour in sylwia_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: sylwia)
            end
            for hour in alex_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: alex)
            end
            for hour in joe_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: joe)
            end
            for hour in shaq_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: shaq)
            end
        end
    elsif month == 2
        for day in (1..28)
            for hour in vidhi_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: vidhi)
            end
            for hour in sylwia_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: sylwia)
            end
            for hour in alex_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: alex)
            end
            for hour in joe_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: joe)
            end
            for hour in shaq_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: shaq)
            end
        end
    else
        for day in (1..31)
            for hour in vidhi_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: vidhi)
            end
            for hour in sylwia_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: sylwia)
            end
            for hour in alex_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: alex)
            end
            for hour in joe_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: joe)
            end
            for hour in shaq_times
                datetime = DateTime.new(DateTime.now.year, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: shaq)
            end
        end
    end
end

#Getting rid of weekend appointments (they need to rest)
for appointment in Appointment.all
    if appointment.begin_datetime.wday == 6 || appointment.begin_datetime.wday == 0 #deleting Saturdays and Sundays
        appointment.destroy
    end
end


# s99 = Student.create(name: "tester", age: 18)




# Appointment.create(datetime: DateTime.new(2020, 6, 9, 13), note: "Biology Lesson: Cell and Developmental Biology", student_id: 56, tutor_id: 9)
# # Appointment.create(datetime: DateTime.new(2020, 6, 9, 14), note: "We said we were gonna cover basic trigonometry", student_id: 57, tutor_id: 9)
# Appointment.create(datetime: DateTime.new(2020, 6, 9, 15), note: "Might be a tad late", student_id: 58, tutor_id: 9)
# Appointment.create(datetime: DateTime.new(2020, 6, 9, 16), student_id: 59, tutor_id: 9)


# Student.create(name: "Thomas", age: 15)
# Student.create(name: "Eric", age: 18)
# Student.create(name: "Sally", age: 18)
# Student.create(name: "Molly", age: 17)
# Student.create(name: "David", age: 16)