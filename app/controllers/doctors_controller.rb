class DoctorsController < ApplicationController
  load_and_authorize_resource

  def index
    @doctors = Doctor.order(full_name: :asc).all
  end
end
