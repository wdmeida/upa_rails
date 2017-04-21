class Backoffice::SpecializationsController < BackofficeController
   
    before_action :set_specialization, only: [:edit, :update]

    def index
        @specializations = Specialization.all
    end

    def new
        @specialization = Specialization.new
    end

    def create
        @specialization = Specialization.create(params_specialization)

        unless @specialization.errors.any?
            redirect_to backoffice_specializations_path, notice: I18n.t('messages.created_with', :item => @specialization.description)
        else
            render :new 
        end
    end

    def edit     
    end

    def update
        if @specialization.update(params_specialization)
            redirect_to backoffice_specializations_path, notice: I18n.t('messages.updated_with', :item => @specialization.description) 
        else
            render :edit
        end
    end

    private
        
        def set_specialization
            @specialization = Specialization.find(params[:id])
        end

        def params_specialization
            params.require(:specialization).permit(:description)
        end
end
