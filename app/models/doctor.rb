class Doctor < User
  has_many :appointments, dependent: :nullify
  has_many :patients, through: :appointments
  belongs_to :category

  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
