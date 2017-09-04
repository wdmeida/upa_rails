require 'rails_helper'

RSpec.describe Upa::PatientsController, type: :controller do
  render_views

  let!(:patients) { create_list(:patient, 10) }
  let(:patient) { patient.last }
end