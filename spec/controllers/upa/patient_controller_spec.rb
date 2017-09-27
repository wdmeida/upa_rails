require 'rails_helper'

RSpec.describe Upa::PatientsController, type: :controller do
  render_views

  let!(:patients) { create_list(:patient, 10) }
  let(:patient) { patients.last }

  describe 'GET #index' do
    context 'when secretary is logged in' do
      login_secretary

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_with_layout(:upa) }
      it { is_expected.to render_template(:index) }

      it 'assign @patients' do
        expect( assigns(:patients) ).to eq(patients)
      end
    end

    context 'when secretary is logged out' do
      before { get :index }
  
      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'GET #new' do
    context 'when secretary is logged in' do
      login_secretary
      before { get :new }

      it { is_expected.to render_template(:new) }
      it { is_expected.to respond_with(:ok) }

      it 'assign @patient' do
        expect(assigns(:patient)).to be_a_new(Patient)
      end
    end

    context 'when secretary is logged out' do
      before { get :new }

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'POST #create' do
    let!(:patient_params) { attributes_for(:patient) }

    context 'when secretary is logged in' do
      login_secretary

      context 'with valid params' do
        before do
          post :create, params: { patient: patient_params }, header: {}
        end

        it { is_expected.to respond_with(:redirect) }
        it { is_expected.to redirect_to "/upa/appointments/new?patient_id=#{patients.length + 1}" }
      end

      context 'with invalid params' do
        let(:patient_invalid) { attributes_for(:patient, name: '') }
        
        before do
          post :create, params: { patient: patient_invalid }, headers: {}
        end

        it { is_expected.to render_template(:new) }
      end
    end

    context 'when secretary is logged out' do
      before do
        post :create, params: { patient: patient_params }, headers: {}
      end

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'GET #edit' do
    context 'when secretary is logged in' do
      login_secretary

      before { get :edit, params: { id: patient.id }, headers: {} }

      context 'with valid params' do
        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 999999999 } }

        it { is_expected.to respond_with(:not_found) }
      end
    end

    context 'when secretary is logged out' do
      before { get :edit, params: { id: patient.id }, headers: {} }

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'PUT #update' do
    let(:patient_attr) do
      { :name => 'new patient name' }
    end

    context 'when secretary is logged in' do
      login_secretary

      context 'with valid params' do
        before do
          get :update, params: { id: patient.id, patient: patient_attr }, headers: {}
          patient.reload
        end

        it { is_expected.to respond_with(:redirect) }
        it { expect(patient.name).to eq(patient_attr[:name]) }
        it { is_expected.to redirect_to upa_patients_path }
      end

      context 'with invalid params' do
        before { get :update, params: { id: patient.id, patient: { name: '' } }, headers: {} }

        it { is_expected.to render_template(:edit) }
      end
    end

    context 'when secretary is logged out' do
      before do
        get :update, params: { id: patient.id, patient: patient_attr }, headers: {}
      end

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end
end