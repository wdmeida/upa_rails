require 'rails_helper'

RSpec.describe Upa::PatientsController, type: :controller do
  render_views

  let!(:patients) { create_list(:patient, 10) }
  let(:patient) { patient.last }

  describe 'GET #index' do
    context 'when secretary is logged in' do
      login_secretary

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_with_layout(:upa) }
      it { is_expected.to render_template(:index) }
    end

    it 'assign @patients' do
      expect( assigns(:patients) ).to eq(@patients)
    end
  end

  context 'when secretary is logged out' do
    before { get :index }

    it { is_expected.to redirect_to new_secretary_session_path }
  end
end