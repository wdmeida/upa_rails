require 'rails_helper'

RSpec.describe Backoffice::DoctorsController, type: :controller do
  render_views

  let!(:doctors) { create_list(:doctor, 10) }
  let(:doctor) { doctors.last }

  describe 'GET #index' do
    context 'when admin is logged in' do
      login_admin

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_with_layout(:backoffice) }
      it { is_expected.to render_template(:index) }

      it 'assign @doctors' do
        expect( assigns(:doctors) ).to eq(doctors)
      end
    end

    context 'when admin is logged out' do
      before { get :index }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'GET #new' do
    context 'when admin is logged in' do
      login_admin
      before { get :new }

      it { is_expected.to render_template(:new) }
      it { is_expected.to respond_with(:ok) }

      it 'assign @doctor' do
        expect(assigns(:doctor)).to be_a_new(Doctor)
      end
    end

    context 'when admin is logged out' do
      before { get :new }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'POST #create' do
    let!(:specialization) { create(:specialization) }
    let(:doctor_params) { attributes_for(:doctor, :specialization_id => specialization.id) }

    context 'when admin is logged in' do
      login_admin

      context 'with valid params' do
        before do
          post :create, params: { doctor: doctor_params }
        end

        it { is_expected.to respond_with(:redirect) }
        it { is_expected.to redirect_to(backoffice_doctors_path) }
      end

      context 'with invalid params' do
        let(:doctor_invalid) { attributes_for(:doctor, name: '') }
        before do
          post :create, params: { doctor: doctor_invalid }
        end

        it { is_expected.to render_template(:new) }
      end
    end

    context 'when admin is logged out' do
      before do
        post :create, params: { doctor: doctor_params }
      end

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'GET #edit' do
    context 'when admin is logged in' do
      login_admin

      context 'with valid params' do
        before { get :edit, params: { id: doctor.id } }

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 99999999 } }

        it { is_expected.to respond_with(:not_found) }
      end
    end

    context 'when admin is logged out' do
      before { get :edit, params: { id: doctor.id } }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'PUT #update' do
    let(:doctor_attr)do
      { :name => 'new doctor name' }
    end

    context 'when admin is logged in' do
      login_admin

      context 'with valid params' do
        before(:each) do
          get :update, params: { id: doctor.id, doctor: doctor_attr }
          doctor.reload
        end

        it { is_expected.to respond_with(:redirect) }
        it { expect(doctor.name).to eq(doctor_attr[:name]) }
        it { is_expected.to redirect_to(backoffice_doctors_path) }
      end

      context 'with invalid params' do
        before { get :update, params: { id: doctor.id, doctor: { name: '' } } }

        it { is_expected.to render_template(:edit) }    
      end
    end

    context 'when admin is logged out' do
      before do
        get :update, params: { id: doctor.id, doctor: doctor_attr }
      end
  
      it { is_expected.to redirect_to new_admin_session_path }
    end
  end
end