class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.order(full_name: :asc).all
  end
end
