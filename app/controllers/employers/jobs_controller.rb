class Employers::JobsController < ApplicationController
  before_action :authenticate_employer!

  def index
    @jobs = current_employer.jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_employer
    @job.save!
    redirect_to employers_job_path(@job)
  end

  def edit
  end

  def update

  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy

  end

private

def job_params
  params.require(:job).permit(:job_title, :salary, :description, :location)
end


end
