class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  enum status: { active: 0, closed: 1 }

  after_update :close_with_conclusion

  private

  def close_with_conclusion
    self.status = "closed" if self.conclusion.present?
  end
end
