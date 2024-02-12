class RemoveAppointmentsCountFromUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :appointments_count
  end

  def down
    add_column :users, :appointments_count, :integer
  end
end
