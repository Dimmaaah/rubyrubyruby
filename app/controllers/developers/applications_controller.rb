class Developers::ApplicationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @applications = current_user.applications
  end

end
