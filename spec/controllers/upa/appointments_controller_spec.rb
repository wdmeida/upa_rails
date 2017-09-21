require 'rails_helper'

RSpec.describe Upa::AppointmentsController, type: :controller do
  render_views

  let!(:appointments) { create_list(:appointment, 10) }
  let(:appointment) { appointments.last }
end
