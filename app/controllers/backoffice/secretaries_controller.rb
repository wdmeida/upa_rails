class Backoffice::SecretariesController < BackofficeController
  before_action :set_secretary, only: [:destroy, :edit, :update]

  def index
    @q = Secretary.ransack(params[:q])
    @secretaries = @q.result
                     .page(params[:page])
                     .per(Constants::QTT_PER_PAGE)

    respond_to do |format|
      format.html {}
      format.js { render layout: false }
    end
  end

  def new
    @secretary = Secretary.new
  end

  def create
    @secretary = Secretary.create(params_secretaries)

    unless @secretary.errors.any?
      redirect_to backoffice_secretaries_path, notice: I18n.t('messages.created_with', 
                                                              :kind => t('activerecord.models.secretary.one'),
                                                              :item => @secretary.name)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @secretary.update(params_secretaries)
      redirect_to backoffice_secretaries_path, notice: I18n.t('messages.updated_with', 
                                                              :kind => t('activerecord.models.secretary.one'), 
                                                              :item => @secretary.name)
    else
      render :edit
    end
  end

  def destroy
    secretary_email = @secretary.email

    if @secretary.destroy
      redirect_to backoffice_secretaries_path, notice: I18n.t('messages.destroyed_with', 
                                                              :kind => t('activerecord.models.secretary.one'),
                                                              :item => secretary_email)
    else
      render :index
    end
  end

  private

    def set_secretary
      begin
        @secretary = Secretary.find(params[:id])
      rescue => exception
        head :not_found
      end
    end

    def params_secretaries
      passwd = params[:secretary][:password]
      passwd_confirmation = params[:secretary][:password_confirmation]

      if passwd.blank? && passwd_confirmation.blank?
        params[:secretary].except(:password, :password_confirmation)
      end

      params.require(:secretary).permit(:name,
                                        :email,
                                        :password,
                                        :password_confirmation)
    end
end
