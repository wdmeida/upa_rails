module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in create(:admin)
    end    
  end

  def login_secretary
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:secretary]
      sign_in create(:secretary)
    end
  end
end