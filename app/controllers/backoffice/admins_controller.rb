class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:destroy, :edit, :update]

  def index
    @q = Admin.ransack(params[:q])
    @admins = @q.result
                .page(params[:page])
                .per(Constants::QTT_PER_PAGE)

    respond_to do |format|
      format.html {}
      format.js { render layout: false }
    end
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(params_admins)

    unless @admin.errors.any?
      redirect_to backoffice_admins_path, notice: I18n.t('messages.created_with', 
                                                            :kind => t('activerecord.models.admin.one'),
                                                            :item => @admin.name)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(params_admins)
      redirect_to backoffice_admins_path, notice: I18n.t('messages.updated_with',
                                                            :kind => t('activerecord.models.admin.one'), 
                                                              :item => @admin.name)
    else
      render :edit
    end
  end

  def destroy
    admin_email = @admin.email

    if @admin.destroy
      redirect_to backoffice_admins_path, notice: I18n.t('messages.destroyed_with', 
                                                              :kind => t('activerecord.models.admin.one'), 
                                                              :item => admin_email)
    else
      render :index
    end
  end

  private

    def set_admin
      begin
        @admin = Admin.find(params[:id])                
      rescue => exception
        head :not_found
      end
    end

    def params_admins
      passwd = params[:admin][:password]
      passwd_confirmation = params[:admin][:password_confirmation]

      # Verifica se password e password_confirmation vieram em branco, o que indica atualização de dados.
      if passwd.blank? && passwd_confirmation.blank?
        params[:admin].except(:password, :password_confirmation)
      end

      params.require(:admin).permit(:name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation)     
    end        
end