require 'rails_helper'

RSpec.describe Backoffice::SpecializationsController, type: :controller do
  render_views

  let!(:specializations) { create_list(:specialization, 10) }
  let(:specialization) { specializations.last }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_admin
      
      before { get :index }

      it { is_expected.to respond_with(:ok) }      
      it { is_expected.to render_with_layout(:backoffice) }      
      it { is_expected.to render_template(:index) }

      it 'assigns @specializations' do
        expect( assigns(:specializations) ).to eq(specializations)
      end
    end

    context 'when user is logged out' do
      before { get :index }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_admin
      before { get :new }
    
      it { is_expected.to render_template(:new) }
      it { is_expected.to respond_with(:ok) }
  
      it 'assign @specialization' do
        expect(assigns(:specialization)).to be_a_new(Specialization)
      end
    end

    context 'when user is logged out' do
      before { get :new }

      it { is_expected.to redirect_to new_admin_session_path }      
    end
  end

  describe 'POST #create' do
    let(:specialization_params) { attributes_for(:specialization) }      
    
    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before do 
          post :create, params: { specialization: specialization_params }
        end

        it { is_expected.to respond_with(:redirect) }
        it { is_expected.to redirect_to(backoffice_specializations_path) }
      end

      context 'with invalid params' do
        before do 
          post :create, params: { specialization: { description: '' } }
        end

        it { is_expected.to render_template(:new) }
      end
    end

    context 'when user is logged out' do
      before do
        post :create, params: { specialization: specialization_params }        
      end

      it { is_expected.to redirect_to new_admin_session_path }            
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before { get :edit, params: { id: specialization.id } }
      
        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 99999999 } }
        
        it { is_expected.to respond_with(:not_found) }
      end
    end

    context 'when user is logged out' do
      before { get :edit, params: { id: specialization.id } }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'PUT #update' do
    let(:specialization_attr) do
      { :description => 'new specialization' }
    end

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before(:each) do 
          get :update, params: { id: specialization.id, specialization: specialization_attr }          
          specialization.reload
        end

        it { is_expected.to respond_with(:redirect) }
        it { expect(specialization.description).to eq(specialization_attr[:description]) }
        it { is_expected.to redirect_to(backoffice_specializations_path) }
      end

      context 'with invalid params' do
        before(:each) do
          get :update, params: { id: specialization.id, specialization: { description: '' } }
        end

        it { is_expected.to render_template(:edit) }
      end
    end

    context 'when user is logged out' do
      before do
        get :update, params: { id: specialization.id, specialization: specialization_attr }          
      end

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end
end