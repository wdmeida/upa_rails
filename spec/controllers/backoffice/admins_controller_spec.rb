require 'rails_helper'

RSpec.describe Backoffice::AdminsController, type: :controller do
  render_views

  let!(:admins) { create_list(:admin, 10) }
  let(:admin) { admins.last }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_admin

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_template(:index) }      
      it { is_expected.to render_with_layout(:backoffice) }

      it 'assigns @admins' do
        expect( assigns(:admins).first ).to eq(admins.first)
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

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_template(:new) }

      it 'assign @admin' do
        expect(assigns(:admin)).to be_a_new(Admin)
      end
    end

    context 'when user is logged out' do
      before { get :new }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'POST #create' do
    let(:admin_params) { attributes_for(:admin) }

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before do
          post :create, params: { admin: admin_params }, headers: {}
        end

        it { is_expected.to respond_with(:redirect) }
        it { is_expected.to redirect_to(backoffice_admins_path) }
      end

      context 'with invalid params' do
        let(:admin_invalid) { attributes_for(:admin, email: '') }
        
        before do
          post :create, params: { admin: admin_invalid }, headers: {}
        end

        it { is_expected.to render_template(:new) }
      end
    end

    context 'when user is logged out' do
      before do
        post :create, params: { admin: admin_params }, headers: {}
      end

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before { get :edit, params: { id: admin.id }, headers: {} }

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 999999 }, headers: {} }
        
        it { is_expected.to respond_with(:not_found) }        
      end
    end

    context 'when user is logged out' do
      before { get :edit, params: { id: admin.id }, headers: {} }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'PUT #update' do
    let(:admin_attr) do
      { :name => 'new name admin' }
    end

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before(:each) do
          get :update, params: { id: admin.id, admin: admin_attr }, headers: {}
          admin.reload
        end

        it { is_expected.to respond_with(:redirect) }
        it { expect(admin.name).to eq(admin_attr[:name]) }
        it { is_expected.to redirect_to(backoffice_admins_path) }
      end

      context 'with invalid params' do
        before(:each) do
          get :update, params: { id: admin.id, admin: { name: '' } }, headers: {}
        end

        it { is_expected.to render_template(:edit) }
      end
    end

    context 'when user is logged out' do
      before do
        get :update, params: { id: admin.id, admin: admin_attr }, headers: {}
      end

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is logged in' do
      login_admin

      context 'with admin id is valid' do
        before { delete :destroy, params: { id: admin.id }, headers: {} }

        it { is_expected.to respond_with(:redirect) }
        
        it 'removes admin from database' do
          expect(Admin.all).not_to include admin
          expect { admin.reload }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
    
    context 'when user is logged out' do
      before { delete :destroy, params: { id: admin.id }, headers: {} }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end
end