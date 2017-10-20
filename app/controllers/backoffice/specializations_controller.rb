class Backoffice::SpecializationsController < BackofficeController
  before_action :set_specialization, only: [:edit, :update]

  def index
    @q = Specialization.ransack(params[:q])
    @specializations = @q.result
                         .page(params[:page])
                         .per(Constants::QTT_PER_PAGE)

    respond_to do |format|
      format.html {}
      format.js { render layout: false }
    end
  end

  def new
    @specialization = Specialization.new
  end

  def create
    @specialization = Specialization.create(params_specialization)

    unless @specialization.errors.any?
      redirect_to backoffice_specializations_path,
                  notice: I18n.t('messages.created_with',
                                  :kind => t('activerecord.models.specialization.one'),
                                  :item => @specialization.description)
    else
      render :new 
    end
  end

  def edit     
  end

  def update
    if @specialization.update(params_specialization)
      redirect_to backoffice_specializations_path, 
                  notice: I18n.t('messages.updated_with', 
                                :kind => t('activerecord.models.specialization.one'),
                                :item => @specialization.description) 
    else
      render :edit
    end
  end

  private
      
    def set_specialization
      begin
        @specialization = Specialization.find(params[:id])
      rescue => exception
        head :not_found 
      end
    end

    def params_specialization
      params.require(:specialization).permit(:description)
    end
end
