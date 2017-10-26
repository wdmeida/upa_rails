require 'rails_helper'

RSpec.describe BackofficeController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_admin!) }
  it { is_expected.not_to use_before_action(:prevent_ssl) }
end