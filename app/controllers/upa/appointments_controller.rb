class Upa::AppointmentsController < UpaController
  before_action :set_current_patient, only: [:new]
  before_action :set_specializations, only: [:new]

  def new
    @appointment = Appointment.new 
  end

  def create
  end

  private
    def set_current_patient
      @patient = Patient.find(params[:patient_id])
    end

    def set_specializations
      @specializations = Specialization.all.includes(:doctors)
    end
end
