class Patient < User
  has_many :appointments, dependent: :nullify
  has_many :doctors, through: :appointments
end
