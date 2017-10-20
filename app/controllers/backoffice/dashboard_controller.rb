class Backoffice::DashboardController < BackofficeController
  def index
    @specializations_group = Specialization.all.collect { |s| [s.description, s.doctors_count] }
  end
end
