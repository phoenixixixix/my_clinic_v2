class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  enum status: { active: 0, closed: 1 }

  validate :appointments_count_for_doctor

  before_update :close_with_conclusion

  scope :by_user, ->(user) { where(patient: user).or(where(doctor: user)) }

  private

  def close_with_conclusion
    self.status = "closed" if self.conclusion.present?
  end

  def appointments_count_for_doctor
    if doctor.appointments.active.size == 10
      errors.add(:base, :to_much, message: "This doctor reached limit of active appointments (10)")
    end
  end
end
