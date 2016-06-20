class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  # the create action finds a job by id
  # the secondline create a new application stores it in a variable
  
  def create
    @job = Job.find(params[:job_id])
    @application = Application.new(application_params)
    @application.job = @job
    @application.user = current_user

    if @application.save
      redirect_to developers_applications_path
    else
      redirect_to job_path(@job)
    end
  end

private
  def application_params
    params.require(:application).permit(:description)
  end
end
