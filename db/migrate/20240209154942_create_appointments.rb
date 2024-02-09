class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.bigint :patient_id, null: false, index: true
      t.bigint :doctor_id, null: false, index: true
      t.foreign_key :users, column: :patient_id
      t.foreign_key :users, column: :doctor_id
      t.string :conclusion
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
