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

  def update
    @user = current_user
    #@resume = current_user.resume || Resume.new(user: current_user)

    if @user.update(user_params) #@resume.update(resume_params)
      flash[:notice] = "User succesfully updated"
      redirect_to developers_profile_path
    else
      flash.now[:alert] = "well that didn't work"
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :job_title,
      :street,
      :birth_date,
      :city,
      resume_attributes: [
        :id,
        :summary,
        :linkedin,
        :photo,
        :photo_cache,
        skill_ids: [],
        educations_attributes: [:id, :name, :school, :start_date, :end_date],
        projects_attributes: [:id, :name, :description],
        work_experiences_attributes: [:id, :start_date, :end_date, :company_name, :job_title, :description]
      ]
    )
  end
end
