class Upa::PatientsController < UpaController
  before_action :set_patient, only: [:edit, :update]

  def index
    @q = Patient.ransack(params[:q])
    @patients = @q.result
                  .page(params[:page])
                  .per(Constants::QTT_PER_PAGE)

    respond_to do |format|
      format.html {}
      format.js { render layout: false }
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(params_patient)

    unless @patient.errors.any?
      redirect_to new_upa_appointment_path(:patient_id => @patient.id), 
                                           notice: I18n.t('messages.created_with',
                                                          :kind => t('activerecord.models.patient.one'), 
                                                          :item => @patient.name)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(params_patient)
      redirect_to upa_patients_path, notice: I18n.t('messages.updated_with', 
                                                    :kind => t('activerecord.models.patient.one'),
                                                    :item => @patient.name)
    else
      render :edit
    end
  end

  private

    def params_patient
      params.require(:patient).permit(:name,
                                      :birth,
                                      :phone,
                                      :genre,
                                      :cpf,
                                      :info)
    end

    def set_patient
      begin
        @patient = Patient.friendly.find(params[:id])      
      rescue => exception
        head :not_found
      end
    end
end
