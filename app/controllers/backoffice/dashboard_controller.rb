class Backoffice::DashboardController < BackofficeController
  before_action :set_specializations, only: [:index]

  def index
    @specializations_group = @specializations.collect { |s| [s.description, s.doctors_count] }
    @appointments_group = @specializations.collect { |s| [s.description, s.appointments_count] }
  end

  private

    def set_specializations
      @specializations = Specialization.all
    end
end
