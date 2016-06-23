class Developers::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @resume = current_user.resume || Resume.new
  end

  def show
   @user = current_user
   @resume = current_user.resume
  end

  def user_update
    @user = current_user
    if @user.update(user_params)
      redirect_to developers_profile_path(@user)
      flash[:notice] = "User succesfully updated"
    else
      redirect_to developers_profile_path(@user)
      flash[:danger] = "Update failed"
    end
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
      work_experiences_attributes: [:id, :start_date, :end_date, :company_name, :job_title, :description],
    )
  end

  def user_params
    params.require(:user).permit(:job_title, :birth_date, :city, :street, :photo, :photo_cache)
  end
end
