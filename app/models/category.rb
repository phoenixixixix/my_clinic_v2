class Category < ApplicationRecord
  has_many :doctors

  validates :title, uniqueness: true, presence: true
end
