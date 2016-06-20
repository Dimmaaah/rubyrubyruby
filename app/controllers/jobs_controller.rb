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



private

def job_params
  params.require(:job).permit(:job_title, :salary, :description, :location)

end

end
