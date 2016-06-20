class JobsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def show
    @application = Application.new
    @job = Job.find(params[:id])
    @employer = @job.employer
  end
end
