class Backoffice::DoctorsController < BackofficeController

    before_action :set_doctor, only: [:edit, :update]
    before_action :set_specialization_for_select, only: [:create, :edit, :new, :update]

    def index
        @doctors = Doctor.page(params[:page]).per(Constants::QTT_PER_PAGE).includes(:specialization)
    end

    def new
        @doctor = Doctor.new    
    end

    def create
        @doctor = Doctor.create(params_doctors)

        unless @doctor.errors.any?
            redirect_to backoffice_doctors_path, notice: I18n.t('messages.created_with', :item => @doctor.name)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @doctor.update(params_doctors)
            redirect_to backoffice_doctors_path, notice: I18n.t('messages.updated_with', :item => @doctor.name)
        else
            render :edit
        end
    end

    private 

        def params_doctors
            passwd = params[:doctor][:password]
            passwd_confirmation = params[:doctor][:password_confirmation]

            if passwd.blank? && passwd_confirmation.blank?
                params[:doctor].except(:password, :password_confirmation)
            end

            params.require(:doctor).permit(:name, 
                                           :email, 
                                           :crm,
                                           :phone, 
                                           :specialization_id, 
                                           :salary,
                                           :password, 
                                           :password_confirmation)
        end

        def set_doctor
            begin
                @doctor = Doctor.find(params[:id])                
            rescue => exception
                head :not_found
            end
        end

        def set_specialization_for_select
           @specializations_options_for_select = Specialization.all 
        end
end
