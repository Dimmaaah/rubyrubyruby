class DevelopersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @developers = User.joins(:resume).first(10)
  end

  def show
    @developer = User.joins(:resume).find(params[:id])
  end
end
