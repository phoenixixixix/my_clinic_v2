class DoctorsController < ApplicationController
  load_and_authorize_resource

  def index
    @doctors = Doctor.by_category(params[:category]).order(full_name: :asc).all
    @category = Category.find(params[:category]) if params[:category]
  end
end
