class Upa::PatientsController < UpaController
  
  def index 
    @patients = Patient.page(params[:page]).per(Constants::QTT_PER_PAGE)
  end
end
