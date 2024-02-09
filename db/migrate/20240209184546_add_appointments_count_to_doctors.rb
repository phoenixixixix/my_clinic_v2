class AddAppointmentsCountToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :appointments_count, :integer
  end
end
