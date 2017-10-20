require 'rails_helper'

RSpec.describe Backoffice::DashboardController, type: :controller do
  render_views

  describe 'GET #index' do
    context 'when user is logged in' do
      login_admin

      before { get :index }

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_template(:index) }
      it { is_expected.to render_with_layout(:backoffice) }

      it 'assigns @specializations_group' do
        expect(:specializations_group).to be_truthy
      end

    end
  end
end