class JobsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @location = params[:location]
    @search = params[:search]

    @jobs = Job.all

    if @location.present?
      @jobs = @jobs.where("LOWER(location) = ?", @location.downcase)
    end

    if @search.present?
      @jobs = @jobs.search(@search)
    end
  end

  def show
    @application = Application.new
    @job = Job.find(params[:id])
    @employer = @job.employer

    store_location_for(:user, job_path(@job))
  end
end
