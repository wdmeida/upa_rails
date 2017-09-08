class Upa::PatientsController < UpaController
  
  def index 
    @patients = Patient.page(params[:page]).per(Constants::QTT_PER_PAGE)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(params_patient)

    unless @patient.errors.any?
      redirect_to upa_patients_path, notice: I18n.t('messages.created_with', :item => @patient.name)
    else
      render :new
    end
  end

  private

    def params_patient
      params.require(:patient).permit(:name,
                                      :birth,
                                      :phone)
    end
end
