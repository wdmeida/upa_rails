require 'rails_helper'

RSpec.describe Backoffice::DoctorsController, type: :controller do
  render_views

  let!(:doctors) { create_list(:doctor, 10) }
  let(:doctor) { doctors.last }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_admin

      before { get :index }

      it { should respond_with(:ok) }
      it { should render_with_layout(:backoffice) }
      it { should render_template(:index) }

      it 'assign @doctors' do
        expect( assigns(:doctors) ).to eq(doctors)
      end
    end

    context 'when user is logged out' do
      before { get :index }

      it { should redirect_to new_admin_session_path }
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_admin
      before { get :new }

      it { should render_template(:new) }
      it { should respond_with(:ok) }

      it 'assign @doctors' do
        expect(assigns(:doctor)).to be_a_new(Doctor)
      end
    end

    context 'when user is logged out' do
      before { get :new }

      it { should redirect_to new_admin_session_path }
    end
  end

  describe 'POST #create' do
    let!(:specialization) { create(:specialization) }
    let(:doctor_params) { attributes_for(:doctor, :specialization_id => specialization.id) }

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before do
          post :create, params: { doctor: doctor_params }, headers: {}
        end

        it { should respond_with(:redirect) }
        it { should redirect_to(backoffice_doctors_path) }
      end

      context 'with invalid params' do
        let(:doctor_invalid) { attributes_for(:doctor, name: '') }
        before do
          post :create, params: { doctor: doctor_invalid }, headers: {}
        end

        it { should render_template(:new) }
      end
    end

    context 'when user is logged out' do
      before do
        post :create, params: { doctor: doctor_params }, headers: {}
      end

      it { should redirect_to new_admin_session_path }
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before { get :edit, params: { id: doctor.id }, headers: {} }

        it { should respond_with(:ok) }
        it { should render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 99999999 } }

        it { should respond_with(:not_found) }
      end
    end

    context 'when user is logged out' do
      before { get :edit, params: { id: doctor.id }, headers: {} }

      it { should redirect_to new_admin_session_path }
    end
  end

  describe 'PUT #update' do
    let(:doctor_attr)do
      { :name => 'new doctor name' }
    end

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before(:each) do
          get :update, params: { id: doctor.id, doctor: doctor_attr }, headers: {}
          doctor.reload
        end

        it { should respond_with(:redirect) }
        it { expect(doctor.name).to eq(doctor_attr[:name]) }
        it { should redirect_to(backoffice_doctors_path) }
      end

      context 'with invalid params' do
        before { get :update, params: { id: doctor.id, doctor: { name: '' } }, headers: {} }

        it { should render_template(:edit) }    
      end
    end

    context 'when user is logged out' do
      before do
        get :update, params: { id: doctor.id, doctor: doctor_attr }, headers: {}
      end
  
      it { should redirect_to new_admin_session_path }
    end
  end
end