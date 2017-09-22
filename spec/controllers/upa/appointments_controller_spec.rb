require 'rails_helper'

RSpec.describe Upa::AppointmentsController, type: :controller do
  render_views

  let!(:appointments) { create_list(:appointment, 10) }
  let!(:appointment) { appointments.last }

  describe 'GET #new' do
    context 'when secretary is logged in' do
      login_secretary
      before { get :new, params: { patient_id: appointment.patient_id }, headers: {} }

      it { is_expected.to render_template(:new) }
      it { is_expected.to respond_with(:ok) }

      it 'assign @appointment' do
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end
    end
  end
end
