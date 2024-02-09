class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  enum status: { active: 0, closed: 1 }
end
