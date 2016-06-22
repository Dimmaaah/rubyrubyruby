class Developers::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

  end

  def edit
    @user = current_user
    @resume = current_user.resume || Resume.new
  end

  def show
   @user = current_user
   @resume = current_user.resume
  end

  def update
    @resume = current_user.resume || Resume.new(user: current_user)

    if @resume.update(resume_params)
      redirect_to developers_profile_path
    else
      flash.now[:alert] = "well that didn't work"
      render :show
    end
  end

  def destroy
  end

  private

  def resume_params
    params.require(:resume).permit(
      :summary,
      :linkedin,
      :photo,
      :photo_cache,
      skill_ids: [],
      educations_attributes: [:id, :name, :school, :start_date, :end_date],
      projects_attributes: [:id, :name, :description],
      work_experiences_attributes: [:id, :start_date, :end_date, :company_name, :job_title, :description]
    )
  end
end
