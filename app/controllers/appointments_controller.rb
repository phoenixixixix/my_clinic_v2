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
    @appointment.patient_id = current_user.id

    if @appointment.save
      redirect_to root_path, notice: "Appointment created!"
    else
      redirect_to doctors_path, alert: "Can't book appointment: #{@appointment.errors.full_messages.join(", ")}"
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
    params.require(:appointment).permit(:doctor_id, :conclusion)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
