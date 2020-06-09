class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.string :note
      t.integer :student_id
      t.integer :tutor_id
    end
  end
end
