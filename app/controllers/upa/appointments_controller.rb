class Upa::AppointmentsController < UpaController
  before_action :set_current_patient, only: [:new]
  before_action :set_specializations, only: [:new, :edit, :update]
  before_action :set_appointment, only: [:destroy, :edit, :update]

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
      redirect_to new_upa_appointment_path(:patient_id => params[:appointment][:patient_id])
    end
  end

  def edit
  end

  def destroy
    if @appointment.destroy
      redirect_to upa_appointments_path, notice: I18n.t('messages.destroyed_with', :item => @patient.name)
    else
      render :index
    end
  end

  def update
    if @appointment.update(params_appointment)
      redirect_to upa_appointments_path, notice: I18n.t('messages.updated_with', :item => @appointment.patient.name)
    else
      render :edit
    end
  end

  private
    def params_appointment
      params.require(:appointment).permit(:datetime_appointment,
                                          :appointment_finished,
                                          :info,
                                          :patient_id,
                                          :specialization_id,
                                          :doctor_id)
    end

    def set_current_patient
      begin
        @patient = Patient.find(params[:patient_id])        
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
        @patient = @appointment.patient
      rescue => exception
        head :not_found
      end
    end
end
