class UpaController < ApplicationController
  before_action :authenticate_secretary!

  layout 'upa'
end
