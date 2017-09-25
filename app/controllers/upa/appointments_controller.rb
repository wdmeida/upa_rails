class Upa::AppointmentsController < UpaController
  before_action :set_current_patient, only: [:new, :edit]
  before_action :set_specializations, only: [:new]
  before_action :set_appointment, only: [:edit]

  def index
    @q = Appointment.ransack(params[:q])
    @appointments = @q.result.includes(:patient)
                              .page(params[:page])
                              .per(Constants::QTT_PER_PAGE)
  end

  def new
    @appointment = Appointment.new 
  end

  def create
    @appointment = Appointment.create(params_appointment)

    unless @appointment.errors.any?
      redirect_to upa_appointments_path, notice: I18n.t('messages.appointment.created_with', 
                                                        :item => @appointment.patient.name)
    else
      redirect_to new_upa_appointment_path, :patient_id => params[:patient_id]
    end
  end

  def edit
  end

  private
    def params_appointment
      params.require(:appointment).permit(:datetime_appointment,
                                          :appointment_finished,
                                          :diagnostic,
                                          :patient_id,
                                          :specialization_id,
                                          :doctor_id)
    end

    def set_current_patient
      begin
        @appointment = Appointment.find(params[:patient_id])        
      rescue => exception
        head :not_found
      end
    end

    def set_specializations
      @specializations = Specialization.all.includes(:doctors)
    end

    def set_appointment
      begin
        @appointment = Appointment.find(params[:id])
      rescue => exception
        head :not_found
      end
    end
end
