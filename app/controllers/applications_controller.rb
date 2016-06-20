class ApplicationsController < ApplicationController
  def create
    @application = Application.create(application_params)
    @application.user = current_user

    if @application.save!
      redirect_to jobs_path
    else
      redirect_to root
    end
  end


private
def application_params
    params.require(:job).permit(:description, :location, :skills)
end

end
