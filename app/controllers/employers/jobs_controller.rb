class Employers::JobsController < ApplicationController
  before_action :authenticate_employer!

  def index
    @jobs = current_employer.jobs
  end

  def new
    @job = Job.new
    @skills = Skill.order(:name)
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_employer

    @job.save!

    redirect_to employers_job_path(@job)
  end

  def edit
     @skills = Skill.order(:name)
    @job = current_employer.jobs.find(params[:id])
  end

  def update
     @skills = Skill.order(:name)
    @job = current_employer.jobs.find(params[:id])
    if @job.update(job_params)

      flash[:notice] = "Job succesfully updated"
      redirect_to employers_job_path(@job)
    else
      flash.now[:alert] = "well that didn't work"
      render :edit
    end
  end

  def show
    @job = current_employer.jobs.find(params[:id])
    @applications = @job.applications
  end

  def destroy

  end

  private

  def job_params
    params.require(:job).permit(
      :job_title,
      :salary,
      :description,
      :location,
      skill_ids: []
    )
  end
end
