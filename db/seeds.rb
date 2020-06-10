# require 'pry'

Student.destroy_all
Appointment.destroy_all
Tutor.destroy_all
Student.reset_pk_sequence
Appointment.reset_pk_sequence
Tutor.reset_pk_sequence

vidhi = Tutor.create(name: "Vidhi", subject: "CS", years_of_experience: 10)
s99 = Student.create(name: "tester", age: 18)

#Vidhi, every weekday 9-5
vidhi_times = (9..17)

#creating June times
for month in (6..12)
    if month == 6 or month == 9 or month == 11
        for day in (1..30)
            for hour in vidhi_times
                datetime = DateTime.new(2020, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: vidhi)
            end
        end
    else
        for day in (1..31)
            for hour in vidhi_times
                datetime = DateTime.new(2020, month, day, hour)
                appointment = Appointment.create(begin_datetime: datetime, tutor: vidhi)
            end
        end
    end
end


# for hour in vidhi_times
#     for day in (1..31)
#         datetime = DateTime.new(2020, 6, day, hour)
#         appointment = Appointment.create(begin_datetime: datetime, tutor: vidhi)
#         appointment.end_datetime = appointment.begin_datetime + 1.hours
#     end
# end



# Appointment.create(datetime: DateTime.new(2020, 6, 9, 13), note: "Biology Lesson: Cell and Developmental Biology", student_id: 56, tutor_id: 9)
# # Appointment.create(datetime: DateTime.new(2020, 6, 9, 14), note: "We said we were gonna cover basic trigonometry", student_id: 57, tutor_id: 9)
# Appointment.create(datetime: DateTime.new(2020, 6, 9, 15), note: "Might be a tad late", student_id: 58, tutor_id: 9)
# Appointment.create(datetime: DateTime.new(2020, 6, 9, 16), student_id: 59, tutor_id: 9)


# Student.create(name: "Thomas", age: 15)
# Student.create(name: "Eric", age: 18)
# Student.create(name: "Sally", age: 18)
# Student.create(name: "Molly", age: 17)
# Student.create(name: "David", age: 16)