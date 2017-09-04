class Upa::PatientsController < UpaController
  
  QTT_PER_PAGE = 10

  def index 
    @patients = Patient.page(params[:page]).per(QTT_PER_PAGE)
  end
end
