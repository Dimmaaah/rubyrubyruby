class Developers::ApplicationsController < ApplicationController
  def index
    @applications = current_user.applications
  end

end
