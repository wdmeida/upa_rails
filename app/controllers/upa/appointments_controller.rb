class Upa::AppointmentsController < UpaController
  before_action :set_current_patient, only: [:new]

  def new
    @appointment = Appointment.new 
  end

  def create
  end

  private
    def set_current_patient
      @patient = Patient.find(params[:patient_id])
    end
end
