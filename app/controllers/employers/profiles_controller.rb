class Employers::ProfilesController < ApplicationController
    before_action :authenticate_employer!
def show
  @employer = current_employer

end

  def edit
     @employer = current_employer
  end
def update
   @employer = current_employer
  if @employer.update(employer_params)
    redirect_to employers_profile_path
  else
    flash.now[:alert] = "well that didn't work"
    render :show
  end
end

private
def employer_params
  params.require(:employer).permit(
  :company_name,
  :last_name,
  :email,
  :street,
  :postcode,
  :city,
  :country,
  :phone
  )
end


end
