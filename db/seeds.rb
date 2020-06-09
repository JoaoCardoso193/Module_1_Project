# require 'pry'

Student.destroy_all
Appointment.destroy_all
Tutor.destroy_all
Student.create(name: "Thomas", age: 15)
Student.create(name: "Eric", age: 18)
Student.create(name: "Sally", age: 18)
Student.create(name: "Molly", age: 17)
Student.create(name: "David", age: 16)
Tutor.create(name: "Vidhi", subject: "CS", years_of_experience: 10)
Appointment.create(datetime: DateTime.new(2020, 6, 9, 13), note: "Biology Lesson: Cell and Developmental Biology", student_id: 56, tutor_id: 9)
Appointment.create(datetime: DateTime.new(2020, 6, 9, 14), note: "We said we were gonna cover basic trigonometry", student_id: 57, tutor_id: 9)
Appointment.create(datetime: DateTime.new(2020, 6, 9, 15), note: "Might be a tad late", student_id: 58, tutor_id: 9)
Appointment.create(datetime: DateTime.new(2020, 6, 9, 16), student_id: 59, tutor_id: 9)