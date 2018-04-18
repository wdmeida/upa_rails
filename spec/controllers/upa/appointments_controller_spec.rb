require 'rails_helper'

RSpec.describe Upa::AppointmentsController, type: :controller do
  render_views

  let!(:appointments) { create_list(:appointment, 10) }
  let!(:appointment) { appointments.last }

  describe 'GET #index' do
    context 'when secretary is logged in' do
      login_secretary

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_with_layout(:upa) }
      it { is_expected.to render_template(:index) }
    end

    context 'when secretary is logged out' do
      before { get :index }

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'GET #new' do
    context 'when secretary is logged in' do
      login_secretary
      before { get :new, params: { patient_id: appointment.patient_id } }

      it { is_expected.to render_template(:new) }
      it { is_expected.to respond_with(:ok) }

      it 'assign @appointment' do
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end
    end

    context 'when secretary is logged out' do
      before { get :new, params: { patient_id: appointment.patient_id } }
      
      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'POST #create' do
    let!(:doctor) { create(:doctor) }
    let!(:patient) { create(:patient) }
    let!(:appointment_params) do 
      attributes_for(:appointment,
                     :doctor_id => doctor.id,
                     :specialization_id => doctor.specialization_id,
                     :patient_id => patient.id )
    end

    context 'when secretary is logged in' do
      login_secretary

      context 'with valid params' do
        before do 
          post :create, params: { appointment: appointment_params }
        end

        it { is_expected.to respond_with(:redirect) }
        it { is_expected.to redirect_to(upa_appointments_path) }
      end
    end
  end

  describe 'GET #edit' do
    context 'when secretary is logged in' do
      login_secretary

      before { get :edit, params: { id: appointment.id } }

      context 'with valid params' do
        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 9999999999 } }

        it { is_expected.to respond_with(:not_found) }
      end
    end

    context 'when secretary is logged out' do
      before { get :edit, params: { id: appointment.id } }

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'PUT #update' do
    let(:appointment_attr) do
      { 
        :appointment_finished => true   
      }
    end

    context 'when secretary is logged in' do
      login_secretary

      context 'with valid params' do
        before do
          get :update, params: { id: appointment.id, appointment: appointment_attr }
          appointment.reload
        end

        it { is_expected.to respond_with(:redirect) }
        it { expect(appointment.appointment_finished).to eq(appointment_attr[:appointment_finished]) }
        it { is_expected.to redirect_to upa_appointments_path }
      end

      context 'with invalid params' do
        before { get :update, params: { id:appointment.id, appointment: { datetime_appointment: nil } } }

        it { is_expected.to render_template(:edit) }
      end
    end

    context 'when secretary is logged out' do
      before do
        get :update, params: { id: appointment.id, appointment: appointment_attr }
      end

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end

  describe 'DELETE #destroy' do
    context 'when secretary is logged in' do
      login_secretary

      context 'with appointment is valid' do
        before { delete :destroy, params: { id: appointment.id } }

        it { is_expected.to respond_with(:redirect) }

        it 'removes appointment from dabasase' do
          expect(Appointment.all).not_to include appointment
          expect { appointment.reload }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    context 'when secretary is logged out' do
      before { delete :destroy, params: { id: appointment.id } }

      it { is_expected.to redirect_to new_secretary_session_path }
    end
  end
end
