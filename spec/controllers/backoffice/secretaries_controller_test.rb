require 'rails_helper'

RSpec.describe Backoffice::SecretariesController, type: :controller do
  render_views

  let!(:secretaries) { create_list(:secretary, 10) }
  let(:secretary) { secretaries.last }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_admin

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_template(:index) }
      it { is_expected.to render_with_layout(:backoffice) }

      it 'assigns @secretaries' do
        expect( assigns(:secretaries) ).to eq(secretaries)
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

      it 'assign @secretary' do
        expect( assigns(:secretary) ).to be_a_new(Secretary)
      end
    end

    context 'when user is logged out' do
      before { get :new }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'POST #create' do
    let(:secretary_params) { attributes_for(:secretary) }

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before do
          post :create, params: { secretary: secretary_params }, headers: {}
        end

        it { is_expected.to respond_with(:redirect) }
        it { is_expected.to redirect_to(backoffice_secretaries_path) }
      end

      context 'with invalid params' do
        let(:secretary_invalid) { attributes_for(:secretary, email: '') }

        before do
          post :create, params: { secretary: secretary_invalid }, headers: {}
        end

        it { is_expected.to render_template(:new) }
      end
    end

    context 'when user is logged out' do
      before do
        post :create, params: { secretary: secretary_params }, headers: {}
      end

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before { get :edit, params: { id: secretary.id }, headers: {} }

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'with invalid params' do
        before { get :edit, params: { id: 99999 }, headers: {} }

        it { is_expected.to respond_with(:not_found) }
      end
    end

    context 'when user is logged out' do
      before { get :edit, params: { id: secretary.id }, headers: {} }

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end

  describe 'PUT #update' do
    let(:secretary_attr) do
      { :name => 'new name secretary' }
    end

    context 'when user is logged in' do
      login_admin

      context 'with valid params' do
        before(:each) do
          get :update, params: { id: secretary.id, secretary: secretary_attr }, headers: {}
          secretary.reload
        end

        it { is_expected.to respond_with(:redirect) }
        it { expect(secretary.name).to eq(secretary_attr[:name]) }
        it { is_expected.to redirect_to backoffice_secretaries_path }
      end

      context 'with invalid params' do
        before(:each) do
          get :update, params: { id: secretary.id, secretary: { name: '' } }, headers: {}
        end

        it { is_expected.to render_template(:edit) }
      end
    end

    context 'when user is logged out' do
      before do
        get :update, params: { id: secretary.id, secretary: secretary_attr }, headers: {}
      end

      it { is_expected.to redirect_to new_admin_session_path }
    end
  end
end
