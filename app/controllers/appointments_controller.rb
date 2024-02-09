class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i(edit update show)

  def index
    @appointments = Appointment.by_user(current_user).includes(:patient, :doctor)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to root_path, notice: "Appointment created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @appointment.update(blog_params)
      redirect_to root_path, notice: "Appointment updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:conclusion)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
