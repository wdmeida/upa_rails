require 'rails_helper'

RSpec.describe UpaController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_secretary!) }  
  it { is_expected.not_to use_before_action(:prevent_ssl) }  
end